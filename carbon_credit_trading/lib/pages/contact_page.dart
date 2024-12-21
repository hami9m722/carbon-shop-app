import 'package:carbon_credit_trading/extensions/dto.dart';
import 'package:carbon_credit_trading/models/message.dart';
import 'package:carbon_credit_trading/pages/chat_page.dart';
import 'package:carbon_credit_trading/services/format.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late List<Map<String, dynamic>> groupedMessages;
  final TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  bool hasResults = false;
  bool showPeopleTab = true;

  @override
  void initState() {
    super.initState();
  }

  String formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays == 0) {
      return DateFormat.Hm().format(timestamp);
    } else if (timestamp.year == now.year) {
      return DateFormat('dd/MM').format(timestamp);
    } else if (difference.inDays < 7) {
      return DateFormat.EEEE().format(timestamp);
    } else {
      return DateFormat('dd/MM/yy').format(timestamp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Liên hệ",
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        isSearching = value.isNotEmpty;
                      });
                    },
                    onTap: () {
                      setState(() {});
                    },
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      hintText: 'Tìm kiếm',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
                if (FocusScope.of(context).hasFocus && isSearching)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        searchController.clear();
                        FocusScope.of(context).unfocus();
                        isSearching = false;
                        showPeopleTab = true;
                      });
                    },
                    child: const Text(
                      "Hủy",
                      style: TextStyle(
                        color: AppColors.greenPopUpText,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Show People and Messages tabs
          if (searchController.text.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showPeopleTab = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: showPeopleTab
                          ? AppColors.greenButton
                          : Colors.grey[500],
                      foregroundColor: Colors.white),
                  child: const Text("People"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showPeopleTab = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: !showPeopleTab
                          ? AppColors.greenButton
                          : Colors.grey[500],
                      foregroundColor: Colors.white),
                  child: const Text("Messages"),
                ),
              ],
            ),

          Expanded(
            child: FutureBuilder<List<Message>>(future: () async {
              var pagedContactItemDTO =
                  await userControllerApi.getConversations();
              return await pagedContactItemDTO!.toMessages();
            }(), builder: (context, snapshot) {
              if (snapshot.hasData) {
                final messages = snapshot.data;
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: messages?.length,
                  itemBuilder: (context, index) {
                    final message = messages?[index];

                    return ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(message!.receiverAvatar),
                      ),
                      title: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 22,
                          ),
                          children: highlightMatches(
                              message.receiverName,
                              searchController.text,
                              showPeopleTab
                                  ? Colors.yellow
                                  : Colors.transparent),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                children: highlightMatches(
                                    message.content ?? "",
                                    searchController.text,
                                    showPeopleTab
                                        ? Colors.transparent
                                        : Colors.yellow),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            formatTimestamp(message.timestamp),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChatPage(
                              conversationId: message.conversationId,
                              chatWithUserId: message.receiverId,
                              chatWithUserName: message.receiverName,
                              chatWithUserAvatar: message.receiverAvatar,
                            ),
                          ),
                        );
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
