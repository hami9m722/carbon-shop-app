import 'package:carbon_credit_trading/models/transaction.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/custom_ricktext.dart';
import 'package:carbon_credit_trading/theme/transaction_item.dart';
import 'package:flutter/material.dart';

class ProjectApprovedTab extends StatelessWidget {
  const ProjectApprovedTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a list of pending transactions
    final List<Transaction> pendingTransactions = [
      Transaction(
        transactionId: '021',
        contractNumber: 'HD098',
        contractDate: '18/08/2024',
        projectName: 'REDD+ Bảo tồn rừng ngập mặn',
        creditAmount: '10,000',
        totalAmount: '14,000,000 USD',
        seller: 'EcoHome Building Corporation',
        status: 'approved',
      ),
      Transaction(
        transactionId: '022',
        contractNumber: 'HD098',
        contractDate: '20/10/2024',
        projectName: 'REDD+ Bảo tồn rừng ngập mặn',
        creditAmount: '10,000',
        totalAmount: '14,000,000 USD',
        seller: 'EcoHome Building Corporation',
        status: 'approved',
      ),
    ];

    if (pendingTransactions.isEmpty) {
      return const Center(
          child: Text('Không có giao dịch nào đang chờ duyệt.'));
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: pendingTransactions.length,
      itemBuilder: (context, index) {
        final transaction = pendingTransactions[index];
        return TransactionItem(transaction: transaction);
      },
    );
  }
}
