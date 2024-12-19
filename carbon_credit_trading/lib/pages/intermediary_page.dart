import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/pages/intermediary_question_page.dart';
import 'package:carbon_credit_trading/pages/pending_account_page.dart';
import 'package:carbon_credit_trading/pages/project_pending_tab.dart';
import 'package:carbon_credit_trading/pages/transaction_pending_tab.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/custom_menu_widget.dart';
import 'package:flutter/material.dart';

class IntermediaryPage extends StatelessWidget {
  const IntermediaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey userInfoKey = GlobalKey();
    return PopScope(
        canPop: false,
        child: Scaffold(
          appBar: const CustomAppBar(
            title: "Kênh trung gian",
          ),
          body: FutureBuilder<AppUserDTO?>(
              future: userControllerApi.viewUser(currentUserId!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(
                      child:
                          Text('Có lỗi xảy ra khi tải thông tin người dùng'));
                } else if (!snapshot.hasData) {
                  return const Center(
                      child: Text('Không có thông tin người dùng'));
                } else {
                  final appUser = snapshot.data!;
                  return Container(
                    color: AppColors.greyBackGround,
                    child: Column(
                      children: [
                        // User Info Section
                        GestureDetector(
                          key: userInfoKey,
                          onTap: () {
                            RenderBox renderBox = userInfoKey.currentContext!
                                .findRenderObject() as RenderBox;
                            Offset offset =
                                renderBox.localToGlobal(Offset.zero);
                            double left = offset.dx;
                            double top = offset.dy + renderBox.size.height;

                            CustomMenuWidget.showCustomMenu(context,
                                left: left, top: top);
                          },
                          child: Container(
                            color: AppColors.greyBackGround,
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.grey[400],
                                  child: const Icon(Icons.person, size: 30),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        appUser.name ?? '',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        appUser.email ?? '',
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        LayoutBuilder(
                          builder: (context, constraints) {
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              color: Colors.white,
                              child: Wrap(
                                spacing: 5,
                                runSpacing: 10,
                                alignment: WrapAlignment.start,
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth / 3 - 5,
                                    child: _buildActionCard(
                                        Icons.file_copy, 'Duyệt dự án',
                                        onTapped: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ProjectPendingTab(
                                                  previousPage: 'intermediary'),
                                        ),
                                      );
                                    }),
                                  ),
                                  SizedBox(
                                    width: constraints.maxWidth / 3 - 5,
                                    child: _buildActionCard(
                                        Icons.check, 'Duyệt giao dịch',
                                        onTapped: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const TransactionPendingTab(
                                                  previousPage: 'intermediary'),
                                        ),
                                      );
                                    }),
                                  ),
                                  SizedBox(
                                      width: constraints.maxWidth / 3 - 5,
                                      child: _buildActionCard(
                                          Icons.bar_chart, 'Câu hỏi',
                                          onTapped: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const IntermediaryQuestionPage(),
                                          ),
                                        );
                                      })),
                                  SizedBox(
                                      width: constraints.maxWidth / 3 - 5,
                                      child: _buildActionCard(
                                          Icons.bar_chart, 'Duyệt tài khoản',
                                          onTapped: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const PendingAccountPage(),
                                          ),
                                        );
                                      })),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  );
                }
              }),
        ));
  }

  Widget _buildActionCard(IconData icon, String label,
      {VoidCallback? onTapped}) {
    return Container(
      margin: const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: onTapped ?? () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.green),
            const SizedBox(height: 10),
            Text(label,
                style: const TextStyle(fontSize: 15),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
