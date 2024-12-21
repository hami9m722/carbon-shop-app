import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

/*Description
  input for answer
  approve button
  reject button to delete question
*/

class AnswerQuestionPage extends StatefulWidget {
  final QuestionDTO question;

  const AnswerQuestionPage({super.key, required this.question});

  @override
  createState() => _AnswerQuestionPageState();
}

class _AnswerQuestionPageState extends State<AnswerQuestionPage> {
  final TextEditingController answerController = TextEditingController();

  void replyQuestion() async {
    try {
      await mediatorAuditControllerApi.answerQuestion(
          widget.question.id!,
          MediatorAnswerDTO(
              questionId: widget.question.id,
              answer: answerController.text.trim()));
    } catch (e) {
      print("Error fetching pending accounts: $e");
    }
  }

  void rejectQuestion() async {
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Câu hỏi thường gặp",
      ),
      body: Column(
        children: [
          // Hiển thị câu hỏi
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Text(
              widget.question.question ?? "N/A",
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
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
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: TextField(
                controller: answerController,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Nhập câu trả lời...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: replyQuestion,
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.greenButton,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Duyệt và hiển thị câu hỏi',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: rejectQuestion,
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Hủy câu hỏi',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
