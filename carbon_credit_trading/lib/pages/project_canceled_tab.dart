import 'package:flutter/material.dart';

class ProjectCanceledTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mã giao dịch: 023'),
          Text(
            'Số hợp đồng: Đã hủy',
            style: TextStyle(color: Colors.grey),
          ),
          Text('Ngày ký hợp đồng: 05/09/2023'),
          Text('Dự án mua: REDD+ Bảo tồn rừng ngập mặn'),
          Text('Số tín chỉ đăng ký mua: 3,000'),
          Text('Tổng tiền: 4,500,000 USD'),
          Text('Bên bán: CarbonTech Corporation'),
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
