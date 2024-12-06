import 'package:carbon_credit_trading/theme/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:carbon_credit_trading/models/transaction.dart';

class TransactionDetail extends StatelessWidget {
  final Transaction transaction;

  const TransactionDetail({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Chi tiết giao dịch"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mã giao dịch: ${transaction.transactionId}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Số hợp đồng: ${transaction.contractNumber.isEmpty ? "Đang chờ duyệt" : transaction.contractNumber}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Ngày ký hợp đồng: ${transaction.contractDate.isEmpty ? "Đang chờ duyệt" : transaction.contractDate}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Dự án mua: ${transaction.projectName}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Số tín chỉ đăng ký mua: ${transaction.creditAmount}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Tổng tiền: ${transaction.totalAmount}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Bên bán: ${transaction.seller}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              'Trạng thái: ${transaction.status}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
