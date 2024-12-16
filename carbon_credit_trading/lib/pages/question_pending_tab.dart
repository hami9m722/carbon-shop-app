import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/pages/answer_question_page.dart';
import 'package:carbon_credit_trading/pages/question_details_page.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/question_dialog.dart';
import 'package:flutter/material.dart';

class QuestionPendingTab extends StatelessWidget {
  final String? searchQuery;

  const QuestionPendingTab({super.key, this.searchQuery});

  Future<List<QuestionDTO>> viewAllQuestions1() async {
    try {
      // Dữ liệu giả
      final List<QuestionDTO> fakeQuestions = [
        QuestionDTO(
            question: "Tín chỉ carbon là gì và nó hoạt động như thế nào?",
            answer: "Đây là câu trả lời cho câu hỏi 1."),
        QuestionDTO(
            question: "Các công ty có thể làm gì để đạt được tín chỉ carbon?",
            answer: "Đây là câu trả lời cho câu hỏi 2."),
        QuestionDTO(
            question:
                "Tín chỉ carbon có ảnh hưởng gì đến môi trường và kinh tế không?",
            answer: "Đây là câu trả lời cho câu hỏi 3."),
        QuestionDTO(
            question: "Lợi ích của tín chỉ carbon đối với doanh nghiệp?",
            answer: "Đây là câu trả lời cho câu hỏi 4."),
        QuestionDTO(
            question: "Làm thế nào để giao dịch tín chỉ carbon?",
            answer: "Đây là câu trả lời cho câu hỏi 5."),
      ];

      // Giả lập độ trễ như khi gọi API
      await Future.delayed(const Duration(seconds: 1));

      return fakeQuestions;
    } catch (e) {
      print("Error fetching questions: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: FutureBuilder(
              future: viewAllQuestions1(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'Lỗi khi tải dữ liệu',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                } else if (snapshot.hasData) {
                  final questions = snapshot.data!;

                  if (questions.isEmpty) {
                    return const Center(
                      child: Text(
                        'Không có câu hỏi phù hợp',
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }

                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      final question = questions[index];

                      return ListTile(
                        title: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            children: [
                              TextSpan(
                                text: question.question,
                                style: TextStyle(
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AnswerQuestionPage(question: question),
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const Divider(color: Colors.grey, height: 1),
                  );
                } else {
                  return const Center(
                    child: Text(
                      'Không có câu hỏi nào',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
