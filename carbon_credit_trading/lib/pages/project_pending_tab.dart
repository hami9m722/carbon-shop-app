import 'package:flutter/material.dart';

class ProjectPendingTab extends StatelessWidget {
  const ProjectPendingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Mã giao dịch: 021'),
          const Text(
            'Số hợp đồng: Đang chờ duyệt',
            style: TextStyle(color: Colors.red),
          ),
          const Text(
            'Ngày ký hợp đồng: Đang chờ duyệt',
            style: TextStyle(color: Colors.red),
          ),
          const Text('Dự án mua: REDD+ Bảo tồn rừng ngập mặn'),
          const Text('Số tín chỉ đăng ký mua: 10,000'),
          const Text('Tổng tiền: 14,000,000 USD'),
          const Text('Bên bán: EcoHome Building Corporation'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to details page
            },
            child: const Text('Chi tiết'),
          ),
        ],
      ),
    );
  }
}
