import 'package:carbon_credit_trading/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionDetailPage extends StatelessWidget {
  final Transaction transaction;
  const TransactionDetailPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KNB - chi tiết giao dịch'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.green,
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Giao dịch 321 đã liên hành thành công',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Ngày tạo đơn: 11/09/2024'),
            const Text('Ngày cập nhật: 12/09/2024'),
            const Text('Ngày bán giao hàng: 13/09/2024'),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),
            const Text('Doanh nghiệp mua:'),
            const Text('Tên doanh nghiệp: Coastal Mangrove Restoration'),
            const Text('Mã số thuế: 123456789'),
            const Text('Địa chỉ: 123 Đường ABC, TP.HCM'),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),
            const Text('Doanh nghiệp bán:'),
            const Text('Tên doanh nghiệp: EcoRestore Building Corporation'),
            const Text('Mã số thuế: 987654321'),
            const Text('Địa chỉ: 456 Đường DEF, Sydney, Úc'),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),
            const Text('Thông tin đơn:'),
            const Text('Tên sản phẩm: Sản phẩm công nghệ giảm thiểu khí thải'),
            const Text('Số lượng: 1000'),
            const Text('Đơn giá: 10,000,000 VND'),
            const Text('Thành tiền: 10,000,000,000 VND'),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),
            const Text('Hàng được KTV kiểm tra:'),
            const SizedBox(height: 8.0),
            Container(
              height: 200.0,
              color: Colors.grey[300],
              child: const Center(
                child: Text('Hình ảnh kiểm tra chất lượng'),
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Tải xuống'),
            ),
            const SizedBox(height: 16.0),
            const Text('Hình ảnh lô hàng:'),
            const SizedBox(height: 8.0),
            Container(
              height: 200.0,
              color: Colors.grey[300],
              child: const Center(
                child: Text('Hình ảnh lô hàng'),
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Tải xuống'),
            ),
          ],
        ),
      ),
    );
  }
}
