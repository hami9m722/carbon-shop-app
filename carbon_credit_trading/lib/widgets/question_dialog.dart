import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:flutter/material.dart';

class QuestionDialog extends StatefulWidget {
  const QuestionDialog({super.key});

  @override
  createState() => _QuestionDialogState();
}

class _QuestionDialogState extends State<QuestionDialog> {
  final TextEditingController _questionController = TextEditingController();

  void sendQuestion() async {
    try {
      final questionText = _questionController.text.trim();
      if (questionText.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Nội dung câu hỏi không được để trống")),
        );
        return;
      }

      await userControllerApi.newQuestion(UserAskDTO(question: questionText));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Câu hỏi đã được gửi thành công")),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Lỗi khi gửi câu hỏi: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: 300,
        constraints: const BoxConstraints(minHeight: 200),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _questionController,
              maxLines: 5,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Nhập câu hỏi của bạn',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: sendQuestion,
              style: TextButton.styleFrom(
                backgroundColor: AppColors.greenButton,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              ),
              child: const Text(
                'Xác nhận gửi',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
