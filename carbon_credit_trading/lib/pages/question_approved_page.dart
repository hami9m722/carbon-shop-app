import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/pages/question_details_page.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/question_dialog.dart';
import 'package:flutter/material.dart';

class QuestionApprovedTab extends StatelessWidget {
  final String? searchQuery;

  const QuestionApprovedTab({super.key, this.searchQuery});

  Future<List<QuestionDTO>> viewAllQuestions() async {
    try {
      final questions = await userControllerApi.viewQuestions();

      if (questions != null) {
        return questions.content;
      } else {
        return [];
      }
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
              future: viewAllQuestions(),
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
                                style: const TextStyle(
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
                                  QuestionDetailPage(question: question),
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
