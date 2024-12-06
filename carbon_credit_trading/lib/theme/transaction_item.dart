import 'package:carbon_credit_trading/pages/transaction_details.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/custom_ricktext.dart';
import 'package:flutter/material.dart';
import 'package:carbon_credit_trading/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    Color contractTextColor =
        (transaction.status == 'pending' || transaction.status == 'canceled')
            ? Colors.red[800]!
            : Colors.black;

    FontWeight valueFontWeight =
        (transaction.status == 'pending' || transaction.status == 'canceled')
            ? FontWeight.bold // Make it bold if pending or canceled
            : FontWeight.normal;

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customRichText(
              title: 'Mã giao dịch:',
              value: transaction.transactionId,
            ),
            customRichText(
              title: 'Số hợp đồng:',
              value: transaction.status == 'pending'
                  ? 'Đang chờ duyệt'
                  : transaction.status == 'canceled'
                      ? 'Đã hủy'
                      : transaction.contractNumber,
              valueColor: contractTextColor,
              valueWeight: valueFontWeight,
            ),
            customRichText(
              title: 'Ngày ký hợp đồng:',
              value: transaction.status == 'pending'
                  ? 'Đang chờ duyệt'
                  : transaction.status == 'canceled'
                      ? 'Đã hủy'
                      : transaction.contractNumber,
              valueColor: contractTextColor,
              valueWeight: valueFontWeight,
            ),
            customRichText(
              title: 'Dự án mua:',
              value: transaction.projectName,
            ),
            customRichText(
              title: 'Số tín chỉ đăng ký mua:',
              value: transaction.creditAmount,
            ),
            customRichText(
              title: 'Tổng tiền:',
              value: transaction.totalAmount,
            ),
            customRichText(
              title: 'Bên bán:',
              value: transaction.seller,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TransactionDetail(transaction: transaction),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      AppColors.greenButton, // Set background color
                  foregroundColor: Colors.white, // Set text color to white
                ),
                child: const Text(
                  'Chi tiết',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
