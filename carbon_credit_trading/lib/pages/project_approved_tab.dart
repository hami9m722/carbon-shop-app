import 'package:flutter/material.dart';

class ProjectApprovedTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mã giao dịch: 022'),
          Text(
            'Số hợp đồng: Đã duyệt',
            style: TextStyle(color: Colors.green),
          ),
          Text('Ngày ký hợp đồng: 10/10/2023'),
          Text('Dự án mua: REDD+ Bảo tồn rừng ngập mặn'),
          Text('Số tín chỉ đăng ký mua: 5,000'),
          Text('Tổng tiền: 7,000,000 USD'),
          Text('Bên bán: GreenEco Building Corp'),
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
