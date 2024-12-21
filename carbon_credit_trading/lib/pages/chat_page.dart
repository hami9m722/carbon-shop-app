import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/extensions/dto.dart';
import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/models/message.dart';
import 'package:carbon_credit_trading/pages/chat_input_bar.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/services/utils.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/full_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:voice_message_package/voice_message_package.dart';

//

class ChatPage extends StatefulWidget {
  String? conversationId;
  final int chatWithUserId;
  final String chatWithUserName;
  final String chatWithUserAvatar;

  ChatPage(
      {super.key,
      required this.chatWithUserId,
      required this.chatWithUserName,
      required this.chatWithUserAvatar,
      this.conversationId});

  @override
  createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with WidgetsBindingObserver {
  final ScrollController _scrollController = ScrollController();
  final Map<int, GlobalKey> _messageKeys = {};
  final Set<int> loadedMessageIds = {};

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _startPollingNewMessage();
    //_markMessageAsRead(); //if receiver == you
    //_setUserInChat(true);
  }

  void _startPollingNewMessage() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) async {
      await _pollingNewMessage();
    });
  }

  Future<void> _pollingNewMessage() async {
    try {
      if (widget.conversationId == null) {
        return;
      }
      var latestMessage =
          await userControllerApi.getLatestMessage(widget.conversationId!);
      if (latestMessage != null &&
          !loadedMessageIds.contains(latestMessage.id!)) {
        setState(() {
          loadedMessageIds.add(latestMessage.id!);
        });
      }
    } catch (e) {
      print('API error: $e');
    }
  }

  Future<void> _sendTextMessage(String text) async {
    if (text.isNotEmpty) {
      var dto = await userControllerApi.sendMessage(SendChatMessageDTO(
        content: text.trim(),
        receiver: widget.chatWithUserId,
      ));
      setState(() {
        widget.conversationId ??= dto?.conversationId;
      });
    }
  }

  Future<void> onAudioRecorded(String audioUrl) async {
    var file = File(audioUrl);
    var id = await fileControllerApi.uploadFile(file);
    var dto = await userControllerApi.sendMessage(SendChatMessageDTO(
      content: '',
      audioId: id,
      receiver: widget.chatWithUserId,
    ));
    setState(() {
      widget.conversationId ??= dto?.conversationId;
    });
  }

  Future<void> onImageSelected(List<File> images) async {
    var ids = await Future.wait(
        images.map((image) => fileControllerApi.uploadFile(image)));

    var messages = await Future.wait(
        ids.map((id) => userControllerApi.sendMessage(SendChatMessageDTO(
              content: '',
              imageId: id,
              receiver: widget.chatWithUserId,
            ))));

    setState(() {
      widget.conversationId ??= messages.firstOrNull?.conversationId;
    });
  }

  void onVideoSelected(File video) {
    fileControllerApi.uploadFile(video).then((id) async {
      var dto = await userControllerApi.sendMessage(SendChatMessageDTO(
        content: '',
        videoId: id,
        receiver: widget.chatWithUserId,
      ));
      setState(() {
        widget.conversationId ??= dto?.conversationId;
      });
    });
  }

  Future<Duration> _getAudioDuration(String audioUrl) async {
    final AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.setSourceUrl(audioUrl);
    final Duration? duration = await audioPlayer.getDuration();
    return duration!;
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _scrollToOriginalMessage(int messageId) {
    final targetKey = _messageKeys[messageId];

    if (targetKey != null) {
      final context = targetKey.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvokedWithResult: (didPop, result) => {},
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.chatWithUserAvatar),
                    radius: 18,
                  ),
                  const SizedBox(width: 10),
                  Text(widget.chatWithUserName),
                ],
              ),
            ),
            body: buildMessageList(),
          ),
        ));
  }

  Column buildMessageList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FutureBuilder<List<Message>>(future: () async {
          if (widget.conversationId == null) {
            return <Message>[];
          }
          var conversationMessages = await userControllerApi
              .getConversationMessages(widget.conversationId!);
          conversationMessages?.content.forEach((message) {
            loadedMessageIds.add(message.id!);
          });
          return await conversationMessages!.toMessages();
        }(), builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            final conversationMessages = snapshot.data?.reversed.toList();
            return Flexible(
              child: ListView.builder(
                reverse: true,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: groupMessagesByDate(conversationMessages!).length,
                itemBuilder: (context, index) {
                  final groupedMessages =
                      groupMessagesByDate(conversationMessages);

                  final dates = groupedMessages.keys.toList().reversed.toList();

                  final date = dates.elementAt(index);

                  final messages = groupedMessages[date]!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(
                        child: Text(
                          !isToday(date) ? date : 'Hôm nay',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 13),
                        ),
                      ),
                      ...messages.map((message) {
                        final messageKey = GlobalKey();

                        _messageKeys[message.messageId] = messageKey;
                        return Container(
                          key: messageKey,
                          margin: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: message.senderId == currentUserId
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          if (message.senderId != currentUserId)
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  message.senderAvatar),
                                            ),
                                          const SizedBox(width: 8),
                                          _buildMessageContent(message),
                                        ]),
                                    Row(children: [
                                      Text(
                                        DateFormat('HH:mm')
                                            .format(message.timestamp),
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 12),
                                      ),
                                      const SizedBox(width: 2),
                                      Icon(
                                        message.isRead
                                            ? Icons.done_all
                                            : Icons.done,
                                        color: message.isRead
                                            ? Colors.blue
                                            : Colors.grey,
                                      )
                                    ]),
                                  ]),
                            ],
                          ),
                        );
                      }),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            );
          } else {
            return const Center();
          }
        }),
        ChatInputBar(
          onSendMessage: _sendTextMessage,
          onError: showErrorDialog,
          onImageSelected: onImageSelected,
          onVideoSelected: onVideoSelected,
          onAudioRecorded: onAudioRecorded,
        ),
      ],
    );
  }

  Widget _buildMessageContent(Message message) {
    double screenWidth = MediaQuery.of(context).size.width;
    double maxWidth = screenWidth * 0.55;

    return Stack(
        clipBehavior: Clip.none,
        alignment: message.senderId == currentUserId
            ? Alignment.topRight
            : Alignment.topLeft,
        children: [
          Positioned(
              child: message.replyTo != null
                  ? GestureDetector(
                      onTap: () =>
                          _scrollToOriginalMessage(message.replyTo!.messageId),
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          constraints: BoxConstraints(maxWidth: maxWidth),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.replyTo!.senderId == currentUserId
                                    ? 'Phản hồi lại chính bạn'
                                    : 'Phản hồi lại ${message.replyTo!.senderName}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                message.replyTo!.videoUrl != null
                                    ? 'Video ${message.replyTo!.videoUrl}'
                                    : message.replyTo!.imageUrls != null &&
                                            message
                                                .replyTo!.imageUrls!.isNotEmpty
                                        ? 'Ảnh: ${message.replyTo!.imageUrls!.join(", ")}'
                                        : message.replyTo!.audioUrl != null
                                            ? 'Audio: ${message.replyTo!.audioUrl}'
                                            : message.replyTo!.content!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          )),
                    )
                  : const SizedBox()),
          Container(
            margin: EdgeInsets.only(top: message.replyTo != null ? 75 : 0),
            child: message.videoUrl?.isNotEmpty ?? false
                ? GestureDetector(
                    onLongPress: () => _showMessageOptions(message),
                    onTap: () {
                      showFullScreen(context, [message.videoUrl!], 0);
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: const Center(
                        child: Text(
                          "Nhấp vào để xem",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ))
                : message.imageUrls != null && message.imageUrls!.isNotEmpty
                    ? GestureDetector(
                        onLongPress: () => _showMessageOptions(message),
                        child: Column(
                          children:
                              message.imageUrls!.asMap().entries.map((entry) {
                            int index = entry.key;
                            String url = entry.value;

                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showFullScreen(
                                        context, message.imageUrls!, index);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.file(
                                      File(url),
                                      fit: BoxFit.cover,
                                      width: 200,
                                      height: 200,
                                    ),
                                  ),
                                ),
                                if (index < message.imageUrls!.length - 1)
                                  const SizedBox(height: 5),
                              ],
                            );
                          }).toList(),
                        ),
                      )
                    : message.audioUrl?.isNotEmpty ?? false
                        ? GestureDetector(
                            onLongPress: () => _showMessageOptions(message),
                            child: FutureBuilder<Duration>(
                              future: _getAudioDuration(message.audioUrl!),
                              builder: (context, snapshot) {
                                final audioDuration =
                                    snapshot.data ?? const Duration(seconds: 1);
                                return VoiceMessageView(
                                  controller: VoiceController(
                                    audioSrc: message.audioUrl!,
                                    onComplete: () {},
                                    onPause: () {},
                                    onPlaying: () {},
                                    onError: (err) {},
                                    maxDuration: audioDuration,
                                    isFile: true,
                                  ),
                                  innerPadding: 12,
                                  cornerRadius: 20,
                                  circlesColor: Colors.blue,
                                  activeSliderColor: Colors.blue,
                                  size: 38,
                                );
                              },
                            ))
                        : GestureDetector(
                            onLongPress: () => _showMessageOptions(message),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              constraints: BoxConstraints(maxWidth: maxWidth),
                              decoration: BoxDecoration(
                                color: message.senderId == currentUserId
                                    ? Colors.blue
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                message.content ?? '',
                                style: TextStyle(
                                  color: message.senderId == currentUserId
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            )),
          )
        ]);
  }

  void _showMessageOptions(Message message) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  _replyToMessage(message);
                  Navigator.pop(context);
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.reply, color: AppColors.greenButton),
                    SizedBox(height: 4),
                    Text('Reply'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (message.content != null && message.content!.isNotEmpty) {
                    Clipboard.setData(ClipboardData(text: message.content!));
                  } else if (message.videoUrl != null) {
                    Clipboard.setData(ClipboardData(text: message.videoUrl!));
                  } else if (message.imageUrls != null &&
                      message.imageUrls!.isNotEmpty) {
                    String combinedUrls = message.imageUrls!.join('\n');
                    Clipboard.setData(ClipboardData(text: combinedUrls));
                  } else if (message.audioUrl != null) {
                    Clipboard.setData(ClipboardData(text: message.audioUrl!));
                  }
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.copy, color: AppColors.greenButton),
                    SizedBox(height: 4),
                    Text('Copy'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (message.content != null && message.content!.isNotEmpty) {
                    Share.share(message.content!);
                  } else if (message.videoUrl != null) {
                    Share.share(message.videoUrl!);
                  } else if (message.imageUrls != null &&
                      message.imageUrls!.isNotEmpty) {
                    String combinedUrls = message.imageUrls!.join('\n');
                    Share.share(combinedUrls);
                  } else if (message.audioUrl != null) {
                    Share.share(message.audioUrl!);
                  }
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.share, color: AppColors.greenButton),
                    SizedBox(height: 4),
                    Text('Chia sẻ'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _replyToMessage(Message message) {
    setState(() {});
  }
}
