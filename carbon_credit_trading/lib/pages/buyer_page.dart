import 'package:carbon_credit_trading/pages/contact_page.dart';
import 'package:carbon_credit_trading/pages/favorite_tab.dart';
import 'package:carbon_credit_trading/pages/search_tab.dart';
import 'package:carbon_credit_trading/pages/setting_page.dart';
import 'package:carbon_credit_trading/pages/transaction_review_page.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:flutter/material.dart';

//not use api
class BuyerPage extends StatefulWidget {
  const BuyerPage({super.key});

  @override
  createState() => _BuyerPageState();
}

class _BuyerPageState extends State<BuyerPage> {
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
                SearchTab(),
                TransactionReviewPage(),
                ContactPage(),
                FavoriteTab(),
                SettingsPage(),
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
                children: List.generate(5, (index) {
                  IconData icon;
                  String label;

                  switch (index) {
                    case 0:
                      icon = Icons.gamepad;
                      label = "Tìm kiếm";
                      break;
                    case 1:
                      icon = Icons.search;
                      label = "Giao dịch";
                      break;
                    case 2:
                      icon = Icons.add_box;
                      label = "Liên hệ";
                      break;
                    case 3:
                      icon = Icons.favorite;
                      label = "Yêu thích";
                      break;
                    case 4:
                      icon = Icons.person;
                      label = "Tài khoản";
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
