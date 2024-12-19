import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/pages/question_details_page.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:flutter/material.dart';

// all question of 1 account

class UserQuestionPage extends StatelessWidget {
  const UserQuestionPage({super.key});

  Future<List<QuestionDTO>> viewAllQuestions() async {
    try {
      final questions = await userControllerApi.viewQuestions();

      if (questions != null) {
        final filteredQuestions = questions.content
            .where((question) => question.askedBy == currentUserId)
            .toList();

        return filteredQuestions;
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
      appBar: AppBar(
        title: const Text('Câu hỏi của tôi'),
      ),
      body: FutureBuilder<List<QuestionDTO>>(
        future: viewAllQuestions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Có lỗi xảy ra: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Không có câu hỏi nào.'));
          } else {
            final questions = snapshot.data!;
            return ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: CircleAvatar(
                      backgroundColor:
                          question.answer != null ? Colors.green : Colors.red,
                      child: Icon(
                        question.answer != null ? Icons.check : Icons.close,
                        color: Colors.white,
                      ),
                      radius: 30,
                    ),
                    title: Text(
                      question.question!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
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
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
