import 'package:flutter/material.dart';

class ProjectPendingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mã giao dịch: 021'),
          Text(
            'Số hợp đồng: Đang chờ duyệt',
            style: TextStyle(color: Colors.red),
          ),
          Text(
            'Ngày ký hợp đồng: Đang chờ duyệt',
            style: TextStyle(color: Colors.red),
          ),
          Text('Dự án mua: REDD+ Bảo tồn rừng ngập mặn'),
          Text('Số tín chỉ đăng ký mua: 10,000'),
          Text('Tổng tiền: 14,000,000 USD'),
          Text('Bên bán: EcoHome Building Corporation'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to details page
            },
            child: Text('Chi tiết'),
          ),
        ],
      ),
    );
  }
}
