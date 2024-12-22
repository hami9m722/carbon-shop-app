import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/pages/chart_statistic_page.dart';
import 'package:carbon_credit_trading/pages/contact_page.dart';
import 'package:carbon_credit_trading/pages/project_registration_page.dart';
import 'package:carbon_credit_trading/pages/projects_seller_page.dart';
import 'package:carbon_credit_trading/pages/transaction_approved_tab.dart';
import 'package:carbon_credit_trading/pages/transaction_canceled_tab.dart';
import 'package:carbon_credit_trading/pages/transaction_pending_tab.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/custom_menu_widget.dart';
import 'package:flutter/material.dart';

//not use api

class SellerPage extends StatelessWidget {
  const SellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey userInfoKey = GlobalKey();
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Kênh người bán",
      ),
      body: FutureBuilder<AppUserDTO?>(
        future: userControllerApi.viewUser(currentUserId!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
                child: Text('Có lỗi xảy ra khi tải thông tin người dùng'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Không có thông tin người dùng'));
          } else {
            final appUser = snapshot.data!;
            return Container(
              color: Colors.white,
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Transaction Section
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Giao dịch',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: _buildTransactionCard(
                                    'Giao dịch đang chờ duyệt',
                                    '0',
                                    onTapped: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const TransactionPendingTab(
                                            previousPage: 'seller',
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: _buildTransactionCard(
                                    'Giao dịch đã hoàn thành',
                                    '0',
                                    onTapped: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const TransactionApprovedTab(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: _buildTransactionCard(
                                    'Giao dịch đã hủy',
                                    '0',
                                    onTapped: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const TransactionCanceledTab(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: _buildTransactionCard(
                                    'Liên hệ',
                                    '0',
                                    onTapped: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ContactPage(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),

                  const ColoredBox(
                    color: AppColors.greyBackGround,
                    child: SizedBox(
                      height: 20,
                      width: double.infinity,
                    ),
                  ),

                  // Action Buttons Section
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
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
                                'Đăng ký dự án',
                                onTapped: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProjectRegistrationPage(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: constraints.maxWidth / 3 - 5,
                              child: _buildActionCard(
                                Icons.check,
                                'Các dự án',
                                onTapped: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProjectsSellerPage(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: constraints.maxWidth / 3 - 5,
                              child: _buildActionCard(
                                Icons.bar_chart,
                                'Thống kê doanh thu',
                                onTapped: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ChartStatisticPage(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildTransactionCard(String title, String count,
      {VoidCallback? onTapped}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: onTapped ??
            () {
              // Thao tác mặc định khi không có hành động nào được truyền vào
            },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              count,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(IconData icon, String label,
      {VoidCallback? onTapped}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
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
