import 'package:carbon_credit_trading/pages/transaction_pending_tab.dart';
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
          body: Container(
            color: AppColors.greyBackGround,
            child: Column(
              children: [
                // User Info Section
                GestureDetector(
                  key: userInfoKey,
                  onTap: () {
                    RenderBox renderBox = userInfoKey.currentContext!
                        .findRenderObject() as RenderBox;
                    Offset offset = renderBox.localToGlobal(Offset.zero);
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
                                'hami@gmail.com',
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
                                      const TransactionPendingTab(
                                          isApproveTransactionPage: true),
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
