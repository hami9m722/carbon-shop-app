import 'package:carbon_credit_trading/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionDetailPage extends StatelessWidget {
  final Transaction transaction;
  const TransactionDetailPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KNB - chi tiết giao dịch'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.green,
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Giao dịch 321 đã liên hành thành công',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Ngày tạo đơn: 11/09/2024'),
            Text('Ngày cập nhật: 12/09/2024'),
            Text('Ngày bán giao hàng: 13/09/2024'),
            SizedBox(height: 16.0),
            Divider(),
            SizedBox(height: 16.0),
            Text('Doanh nghiệp mua:'),
            Text('Tên doanh nghiệp: Coastal Mangrove Restoration'),
            Text('Mã số thuế: 123456789'),
            Text('Địa chỉ: 123 Đường ABC, TP.HCM'),
            SizedBox(height: 16.0),
            Divider(),
            SizedBox(height: 16.0),
            Text('Doanh nghiệp bán:'),
            Text('Tên doanh nghiệp: EcoRestore Building Corporation'),
            Text('Mã số thuế: 987654321'),
            Text('Địa chỉ: 456 Đường DEF, Sydney, Úc'),
            SizedBox(height: 16.0),
            Divider(),
            SizedBox(height: 16.0),
            Text('Thông tin đơn:'),
            Text('Tên sản phẩm: Sản phẩm công nghệ giảm thiểu khí thải'),
            Text('Số lượng: 1000'),
            Text('Đơn giá: 10,000,000 VND'),
            Text('Thành tiền: 10,000,000,000 VND'),
            SizedBox(height: 16.0),
            Divider(),
            SizedBox(height: 16.0),
            Text('Hàng được KTV kiểm tra:'),
            SizedBox(height: 8.0),
            Container(
              height: 200.0,
              color: Colors.grey[300],
              child: Center(
                child: Text('Hình ảnh kiểm tra chất lượng'),
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {},
              child: Text('Tải xuống'),
            ),
            SizedBox(height: 16.0),
            Text('Hình ảnh lô hàng:'),
            SizedBox(height: 8.0),
            Container(
              height: 200.0,
              color: Colors.grey[300],
              child: Center(
                child: Text('Hình ảnh lô hàng'),
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {},
              child: Text('Tải xuống'),
            ),
          ],
        ),
      ),
    );
  }
}
