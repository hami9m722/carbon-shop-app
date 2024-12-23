import 'package:carbon_credit_trading/extensions/dto.dart';
import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/models/transaction.dart';
import 'package:carbon_credit_trading/services/service.dart';

class TransactionService {
  Future<List<Transaction>> getApprovedTransactions() async {
    var orderFutures = businessOption == BusinessOption.seller
        ? sellerControllerApi.viewAllOrders(status: "DONE")
        : buyerControllerApi.viewAllOrders1(status: "DONE");
    var page = await orderFutures;
    return await page!.toTransactions();
  }

  Future<List<Transaction>> getCancelledTransactions() async {
    var orderFutures = businessOption == BusinessOption.seller
        ? sellerControllerApi.viewAllOrders(status: "CANCELLED")
        : buyerControllerApi.viewAllOrders1(status: "CANCELLED");
    var page = await orderFutures;
    return await page!.toTransactions();
  }

  Future<List<Transaction>> getPendingTransactions() async {
    var processingOrders = businessOption == BusinessOption.mediator
        ? mediatorAuditControllerApi.viewAllOrder(status: "PROCESSING")
        : businessOption == BusinessOption.seller
            ? sellerControllerApi.viewAllOrders(status: "PROCESSING")
            : buyerControllerApi.viewAllOrders1(status: "PROCESSING");
    var initOrders = businessOption == BusinessOption.mediator
        ? mediatorAuditControllerApi.viewAllOrder(status: "INIT")
        : businessOption == BusinessOption.seller
            ? sellerControllerApi.viewAllOrders(status: "INIT")
            : buyerControllerApi.viewAllOrders1(status: "INIT");
    var processing = await processingOrders;
    var init = await initOrders;
    var result = <Transaction>[];

    var processingTransactions = processing!.toTransactions();
    var initTransactions = init!.toTransactions();

    result.addAll(await processingTransactions);
    result.addAll(await initTransactions);
    return result;
  }
}
