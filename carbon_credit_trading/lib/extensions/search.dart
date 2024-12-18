import 'package:carbon_credit_trading/models/transaction.dart';

extension SearchTransaction on List<Transaction> {
  List<Transaction> search(String searchQuery) {
    return where((transaction) {
      return transaction.projectName.contains(searchQuery) ?? false;
    }).toList();
  }
}

extension SearchMapList on List<Map<String, dynamic>> {
  List<Map<String, dynamic>> search(String searchQuery, String key) {
    return where((map) {
      final value = map[key]?.toString() ?? '';
      return value.contains(searchQuery);
    }).toList();
  }
}
