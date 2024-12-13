import 'package:carbon_credit_trading/services/format.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

final List<String> answers = [
  'Tín chỉ carbon là gì và nó hoạt động như thế nào?',
  'Các công ty có thể làm gì để đạt được tín chỉ carbon?',
  'Tín chỉ carbon có ảnh hưởng gì đến môi trường và kinh tế không?'
];

class QuestionDetailPage extends StatefulWidget {
  const QuestionDetailPage({super.key});

  @override
  createState() => _QuestionDetailPageState();
}

class _QuestionDetailPageState extends State<QuestionDetailPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Câu hỏi thường gặp",
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Text(
              'Tìm chỉ carbon là gì và nó hoạt động như thế nào?',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Câu trả lời',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: answers.isNotEmpty
                ? ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: answers.length,
                    itemBuilder: (context, index) {
                      final question = answers[index];

                      return ListTile(
                        title: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            children: highlightMatches(
                              question,
                              searchController.text,
                              Colors.yellow,
                            ),
                          ),
                        ),
                        onTap: () {},
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                  )
                : const Center(
                    child: Text(
                      'Không có câu hỏi phù hợp',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
          )),
        ],
      ),
    );
  }
}
