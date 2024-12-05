import 'package:carbon_credit_trading/pages/profile_page.dart';
import 'package:carbon_credit_trading/pages/project_registration_page.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/custom_appbar.dart';
import 'package:flutter/material.dart';

class SellerPage extends StatelessWidget {
  const SellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        color: Colors.white,
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
                            'Renewable Biomass Energy Ventures',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'andi@renewablebiomass.id',
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
                                'Giao dịch đang chờ duyệt', '0'),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _buildTransactionCard(
                                'Giao dịch đã hoàn thành', '0'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child:
                                _buildTransactionCard('Giao dịch đã hủy', '0'),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _buildTransactionCard('Phản hồi', '0'),
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
            Flexible(
              child: GridView.count(
                crossAxisCount: 4,
                padding: const EdgeInsets.all(15),
                childAspectRatio: 0.5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 5,
                children: [
                  _buildActionCard(Icons.file_copy, 'Đăng ký dự án',
                      onTapped: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProjectRegistrationPage(),
                      ),
                    );
                  }),
                  _buildActionCard(Icons.check, 'Dự án đã duyệt'),
                  _buildActionCard(Icons.contact_page, 'Liên hệ'),
                  _buildActionCard(Icons.bar_chart, 'Thống kê doanh thu'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionCard(String title, String count) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
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
    );
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
