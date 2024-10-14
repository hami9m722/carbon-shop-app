import 'package:flutter/material.dart';

class ProjectCanceledTab extends StatelessWidget {
  const ProjectCanceledTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Mã giao dịch: 023'),
          const Text(
            'Số hợp đồng: Đã hủy',
            style: TextStyle(color: Colors.grey),
          ),
          const Text('Ngày ký hợp đồng: 05/09/2023'),
          const Text('Dự án mua: REDD+ Bảo tồn rừng ngập mặn'),
          const Text('Số tín chỉ đăng ký mua: 3,000'),
          const Text('Tổng tiền: 4,500,000 USD'),
          const Text('Bên bán: CarbonTech Corporation'),
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
