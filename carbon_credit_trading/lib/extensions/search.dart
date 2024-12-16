import 'package:carbon_credit_trading/models/transaction.dart';

extension SearchTransaction on List<Transaction> {
  List<Transaction> search(String searchQuery) {
    return where((transaction) {
      return transaction?.projectName?.contains(searchQuery) ?? false;
    }).toList();
  }
}
