import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/pages/answer_question_page.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:flutter/material.dart';

// pending question info (question)

class QuestionPendingTab extends StatelessWidget {
  final String? searchQuery;

  const QuestionPendingTab({super.key, this.searchQuery});

  Future<List<QuestionDTO>> viewAllQuestions1() async {
    var page = await mediatorAuditControllerApi.viewAllQuestion();
    if (page != null) {
      return page.content;
    } else {
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
