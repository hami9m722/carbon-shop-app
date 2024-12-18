import 'package:carbon_credit_trading/extensions/dto.dart';
import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/models/transaction.dart';
import 'package:carbon_credit_trading/services/service.dart';

class TransactionService {

  Future<List<Transaction>> getApprovedTransactions() async {
    var orderFutures = businessOption == BusinessOption.seller ? sellerControllerApi.viewAllOrders(status: "DONE") : buyerControllerApi.viewAllOrders1(status: "DONE");
    var page = await orderFutures;
    return await page!.toTransactions();
  }

  Future<List<Transaction>> getCancelledTransactions() async {
    var orderFutures = businessOption == BusinessOption.seller ? sellerControllerApi.viewAllOrders(status: "CANCELLED") : buyerControllerApi.viewAllOrders1(status: "CANCELLED");
    var page = await orderFutures;
    return await page!.toTransactions();
  }

  Future<List<Transaction>> getPendingTransactions() async {
    var orderFutures = businessOption == BusinessOption.seller ? sellerControllerApi.viewAllOrders(status: "PROCESSING") : buyerControllerApi.viewAllOrders1(status: "PROCESSING");
    var page = await orderFutures;
    return await page!.toTransactions();
  }
}
