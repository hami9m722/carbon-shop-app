import 'package:carbon_credit_trading/models/message.dart';
import 'package:carbon_credit_trading/pages/chat_page.dart';
import 'package:carbon_credit_trading/services/format.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final List<Message> mockMessages = [
  Message(
    senderName: 'John Doe',
    senderAvatar: 'https://example.com/avatar1.jpg',
    receiverName: 'You',
    receiverAvatar: 'https://example.com/your_avatar.jpg',
    content: 'Hey, how are you?',
    timestamp: DateTime.parse('2024-10-15 10:31:00'),
    isRead: true,
  ),
  Message(
    senderName: 'You',
    senderAvatar: 'https://example.com/your_avatar.jpg',
    receiverName: 'John Doe',
    receiverAvatar: 'https://example.com/avatar1.jpg',
    content: 'I\'m fine, thanks!',
    timestamp: DateTime.parse('2024-10-20 10:32:00'),
    isRead: true,
  ),
  Message(
    senderName: 'Jane Smith',
    senderAvatar: 'https://example.com/avatar2.jpg',
    receiverName: 'You',
    receiverAvatar: 'https://example.com/your_avatar.jpg',
    content: 'Let\'s catch up John later',
    timestamp: DateTime.parse('2024-10-19 09:20:00'),
    isRead: false,
  ),
];

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
    groupedMessages = groupMessagesByReceiver();
  }

  List<Map<String, dynamic>> groupMessagesByReceiver() {
    var grouped = groupBy(
        mockMessages.where((message) {
          return message.senderName == 'You' || message.receiverName == 'You';
        }).toList(), (Message m) {
      return m.senderName == 'You' ? m.receiverName : m.senderName;
    });

    return grouped.entries.map((entry) {
      final latestMessage = entry.value
          .reduce((a, b) => a.timestamp.isAfter(b.timestamp) ? a : b);

      String contactName = latestMessage.senderName == 'You'
          ? latestMessage.receiverName
          : latestMessage.senderName;

      return {
        'name': contactName,
        'avatar': latestMessage.senderName == 'You'
            ? latestMessage.receiverAvatar
            : latestMessage.senderAvatar,
        'latestMessage': latestMessage.content,
        'timestamp': latestMessage.timestamp,
        'isRead': latestMessage.isRead,
      };
    }).toList();
  }

  List<Map<String, dynamic>> getFilteredMessages() {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      return groupedMessages;
    }

    return groupedMessages.where((message) {
      final name = message['name'].toLowerCase();
      final latestMessage = message['latestMessage'].toLowerCase();
      return name.contains(query) || latestMessage.contains(query);
    }).toList();
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

  String truncateMessage(String message) {
    if (message.length > 30) {
      return '${message.substring(0, 30)}...';
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    final filteredMessages = getFilteredMessages();
    hasResults = filteredMessages.isNotEmpty;

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
                      setState(() {
                        isSearching = true;
                      });
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
                if (isSearching)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        searchController.clear();
                        FocusScope.of(context).unfocus();
                        isSearching = false;
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

          // Show people and message tab
          // if (isSearching && hasResults)
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       ElevatedButton(
          //         onPressed: () {
          //           // Logic tìm kiếm theo người
          //         },
          //         child: const Text("People"),
          //       ),
          //       ElevatedButton(
          //         onPressed: () {
          //           // Logic tìm kiếm theo tin nhắn
          //         },
          //         child: const Text("Messages"),
          //       ),
          //     ],
          //   ),
          Expanded(
            child: filteredMessages.isNotEmpty
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: filteredMessages.length,
                    itemBuilder: (context, index) {
                      final message = filteredMessages[index];

                      return ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(message['avatar']),
                        ),
                        title: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontWeight: message['isRead']
                                  ? FontWeight.w600
                                  : FontWeight.bold,
                              color: Colors.black,
                              fontSize: 22,
                            ),
                            children: highlightMatches(
                              message['name'],
                              searchController.text,
                              Colors.yellow,
                            ),
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
                                  style: TextStyle(
                                    fontWeight: message['isRead']
                                        ? FontWeight.normal
                                        : FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                  children: highlightMatches(
                                    message['latestMessage'],
                                    searchController.text,
                                    Colors.yellow,
                                  ),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              formatTimestamp(message['timestamp']),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        trailing: !message['isRead']
                            ? Container(
                                height: 12,
                                width: 12,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                              )
                            : null,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChatPage(
                                contactName: message['name'],
                                contactAvatar: message['avatar'],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )
                : const Center(
                    child: Text('Không có kết quả',
                        style: TextStyle(fontSize: 16))),
          ),
        ],
      ),
    );
  }
}
