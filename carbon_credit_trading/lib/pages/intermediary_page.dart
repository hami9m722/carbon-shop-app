import 'package:carbon_credit_trading/pages/profile_page.dart';
import 'package:carbon_credit_trading/pages/transaction_review_page.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/custom_appbar.dart';
import 'package:flutter/material.dart';

class IntermediaryPage extends StatelessWidget {
  const IntermediaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          appBar: const CustomAppBar(
            title: "Kênh trung gian",
          ),
          body: Container(
            color: AppColors.greyBackGround,
            child: Column(
              children: [
                // User Info Section
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
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
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nguyễn Hà Mi',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'hami@forest.com',
                                style: TextStyle(color: Colors.grey),
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
                              Icons.file_copy,
                              'Duyệt dự án',
                            ),
                          ),
                          SizedBox(
                            width: constraints.maxWidth / 3 - 5,
                            child: _buildActionCard(
                                Icons.check, 'Duyệt giao dịch', onTapped: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TransactionReviewPage(),
                                ),
                              );
                            }),
                          ),
                          SizedBox(
                            width: constraints.maxWidth / 3 - 5,
                            child: _buildActionCard(
                                Icons.bar_chart, 'Thống kê doanh thu'),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildActionCard(IconData icon, String label,
      {VoidCallback? onTapped}) {
    return Container(
      margin: const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: onTapped ??
            () {
              // Thao tác mặc định khi không có hành động nào được truyền vào
            },
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
