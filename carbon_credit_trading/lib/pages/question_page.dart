import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/pages/question_details_page.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/question_dialog.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final TextEditingController searchController = TextEditingController();
  bool isSearching = false;

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

  void showQuestionDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => const QuestionDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Câu hỏi thường gặp",
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Tìm hiểu thêm về tín chỉ Carbon',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
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
                        onEditingComplete: () {
                          FocusScope.of(context).unfocus();
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          hintText: 'Tìm kiếm',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
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
                                    style: TextStyle(
                                      backgroundColor: isSearching &&
                                              searchController.text.isNotEmpty
                                          ? Colors.yellow
                                          : Colors.transparent,
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
          Positioned(
            bottom: 12,
            right: 12,
            child: TextButton(
              onPressed: showQuestionDialog,
              style: TextButton.styleFrom(
                backgroundColor: AppColors.greenButton,
              ),
              child: const Text(
                'Thêm câu hỏi',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
