import 'package:flutter/material.dart';

class ProjectApprovedTab extends StatelessWidget {
  const ProjectApprovedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Mã giao dịch: 022'),
          const Text(
            'Số hợp đồng: Đã duyệt',
            style: TextStyle(color: Colors.green),
          ),
          const Text('Ngày ký hợp đồng: 10/10/2023'),
          const Text('Dự án mua: REDD+ Bảo tồn rừng ngập mặn'),
          const Text('Số tín chỉ đăng ký mua: 5,000'),
          const Text('Tổng tiền: 7,000,000 USD'),
          const Text('Bên bán: GreenEco Building Corp'),
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
