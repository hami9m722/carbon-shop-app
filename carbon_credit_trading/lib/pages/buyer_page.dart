import 'package:carbon_credit_trading/theme/custom_appbar.dart';
import 'package:flutter/material.dart';

class BuyerPage extends StatelessWidget {
  const BuyerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          appBar: const CustomAppBar(
            title: "Kênh người bán",
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(Icons.person, size: 30),
                    ),
                    const SizedBox(width: 10),
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
                          Text('andi@renewablebiomass.id'),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        // Thao tác quay lại
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Transaction Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTransactionCard('Giao dịch đang chờ duyệt', '0'),
                    _buildTransactionCard('Giao dịch đã hoàn thành', '0'),
                    _buildTransactionCard('Giao dịch đã hủy', '0'),
                    _buildTransactionCard('Phản hồi', '0'),
                  ],
                ),
                const SizedBox(height: 20),
                // Action Buttons Section
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      _buildActionCard(Icons.file_copy, 'Đăng ký dự án'),
                      _buildActionCard(Icons.check, 'Dự án đã duyệt'),
                      _buildActionCard(Icons.contact_page, 'Liên hệ'),
                      _buildActionCard(Icons.bar_chart, 'Thống kê doanh thu'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildTransactionCard(String title, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(title, textAlign: TextAlign.center),
      ],
    );
  }

  Widget _buildActionCard(IconData icon, String label) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Thao tác khi nhấn
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.green),
              const SizedBox(height: 10),
              Text(label, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
