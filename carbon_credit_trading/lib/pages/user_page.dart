import 'package:carbon_credit_trading/pages/business_options_page.dart';
import 'package:carbon_credit_trading/pages/question_page.dart';
import 'package:carbon_credit_trading/pages/user_question_page.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:flutter/material.dart';

//not use apiapi

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  void onTabTapped(int index) {
    pageController.jumpToPage(index);
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.greyBackGround,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 90),
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                UserQuestionPage(),
                QuestionPage(),
                BusinessOptionsPage()
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 85,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 40,
                  ),
                ],
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(3, (index) {
                  IconData icon;
                  String label;

                  switch (index) {
                    case 0:
                      icon = Icons.gamepad;
                      label = "Câu hỏi của tôi";
                      break;
                    case 1:
                      icon = Icons.search;
                      label = "Câu hỏi thường gặp";
                      break;
                    case 2:
                      icon = Icons.add_box;
                      label = "Về giao dịch";
                      break;
                    default:
                      icon = Icons.error;
                      label = "";
                  }

                  return GestureDetector(
                    onTap: () => onTabTapped(index),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 50,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Transform.translate(
                                offset:
                                    Offset(0, currentIndex == index ? -10 : 0),
                                child: Transform.rotate(
                                  angle: currentIndex == index
                                      ? -15 * (3.14159 / 180)
                                      : 0,
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    height: currentIndex == index ? 50 : 48,
                                    width: currentIndex == index ? 50 : 48,
                                    decoration: BoxDecoration(
                                      color: currentIndex == index
                                          ? Colors.white
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: currentIndex == index
                                          ? [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                blurRadius: 20,
                                                offset: const Offset(0, 10),
                                              )
                                            ]
                                          : [],
                                    ),
                                    child: Center(
                                      child: Icon(
                                        icon,
                                        size: currentIndex == index ? 36 : 28,
                                        color: currentIndex == index
                                            ? Colors.green
                                            : Colors.black26,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          label,
                          style: TextStyle(
                            color: currentIndex == index
                                ? Colors.green
                                : Colors.black26,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
