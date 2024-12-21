import 'dart:io';

import 'package:carbon_credit_trading/models/message.dart';
import 'package:carbon_credit_trading/widgets/add_video_button.dart';
import 'package:carbon_credit_trading/widgets/audio_recorder_button.dart';
import 'package:carbon_credit_trading/widgets/image_picker_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../theme/colors.dart';

class ChatInputBar extends StatefulWidget {
  final Function(String) onSendMessage;
  final Function(List<File>) onImageSelected;
  final Function(File) onVideoSelected;
  final Function(String) onError;
  final Function(String audioPath) onAudioRecorded;

  const ChatInputBar(
      {super.key,
      required this.onSendMessage,
      required this.onImageSelected,
      required this.onVideoSelected,
      required this.onError,
      required this.onAudioRecorded});

  @override
  createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  final TextEditingController messageController = TextEditingController();
  bool isTyping = false;

  final TextEditingController _controller = TextEditingController();
  bool _isSendButtonVisible = false;
  bool _isOptionsVisible = false;
  Message? _replyMessage;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_checkText);
  }

  void _checkText() {
    setState(() {
      _isSendButtonVisible = _controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_checkText);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (_replyMessage != null) _buildReply(_replyMessage!),
      Row(
        children: [
          AnimatedRotation(
            turns: _isOptionsVisible ? 0.5 : 0,
            duration: const Duration(milliseconds: 300),
            child: IconButton(
              icon: Icon(
                _isOptionsVisible
                    ? Icons.cancel_outlined
                    : Icons.add_circle_outline_outlined,
                size: 40,
              ),
              onPressed: _toggleOptions,
            ),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Gửi tin nhắn ...',
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          if (_isSendButtonVisible)
            IconButton(
              icon: const Icon(Icons.send, color: AppColors.greenButton),
              onPressed: () {
                widget.onSendMessage.call(_controller.text);
                setState(() {
                  _replyMessage = null;
                  _controller.clear();
                });
              },
            ),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      if (_isOptionsVisible)
        Container(
          padding: const EdgeInsets.all(10),
          color: Colors.grey[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImagePickerButton(
                onImagesSelected: widget.onImageSelected,
                child: _buildOptionItem(Icons.camera_alt, 'Chọn ảnh'),
              ),
              AddVideoButton(
                picker: ImagePicker(),
                showErrorDialog: widget.onError,
                onVideoChanged: widget.onVideoSelected,
                child: _buildOptionItem(Icons.video_call, 'Chọn video'),
              ),
              AudioRecorderButton(onAudioRecorded: widget.onAudioRecorded),
            ],
          ),
        ),
    ]);
  }

  void _toggleOptions() {
    setState(() {
      _isOptionsVisible = !_isOptionsVisible;
      FocusScope.of(context).unfocus();
    });
  }

  Widget _buildOptionItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 30),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }

  Widget _buildReply(Message replyMessage) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 5),
      width: double.infinity,
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  replyMessage.senderName == 'You'
                      ? 'Phản hồi chính bạn'
                      : 'Phản hồi lại ${replyMessage.senderName}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  replyMessage.content != null &&
                          replyMessage.content!.isNotEmpty
                      ? replyMessage.content!
                      : replyMessage.videoUrl != null
                          ? replyMessage.videoUrl!
                          : replyMessage.imageUrls != null &&
                                  replyMessage.imageUrls!.isNotEmpty
                              ? replyMessage.imageUrls!.join('\n')
                              : replyMessage.audioUrl ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.grey),
            onPressed: () {
              setState(() {
                _replyMessage = null;
              });
            },
          ),
        ],
      ),
    );
  }
}
