import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/models/user.dart';

class Transaction {
  final int transactionId;
  final String contractNumber;
  final String contractDate;
  final String projectName;
  final String creditAmount;
  final String totalAmount;
  final User? seller;
  final User? buyer;
  final String status;
  final Project projectInfo;
  final OrderDTO rootDto;
  final CompanyDTO? buyerCompany;

  Transaction(
    this.rootDto, {
    required this.transactionId,
    required this.contractNumber,
    required this.contractDate,
    required this.projectName,
    required this.creditAmount,
    required this.totalAmount,
    required this.seller,
    required this.buyer,
    required this.projectInfo,
    required this.status,
    this.buyerCompany,
  });
}
