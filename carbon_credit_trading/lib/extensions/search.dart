import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/models/transaction.dart';

extension SearchTransaction on List<Transaction> {
  List<Transaction> search(String searchQuery) {
    return where((transaction) {
      return transaction.projectName.contains(searchQuery) ?? false;
    }).toList();
  }
}

extension SearchProject on List<Project> {
  List<Project> search(String searchQuery) {
    return where((project) {
      return project.projectName.contains(searchQuery);
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
