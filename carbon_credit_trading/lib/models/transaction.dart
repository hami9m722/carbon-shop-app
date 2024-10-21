class Transaction{
  final String transactionId;
  final String contractNumber;
  final String contractDate;
  final String projectName;
  final String creditAmount;
  final String totalAmount;
  final String seller;
  final String status;

  Transaction({
    required this.transactionId,
    required this.contractNumber,
    required this.contractDate,
    required this.projectName,
    required this.creditAmount,
    required this.totalAmount,
    required this.seller,
    required this.status,
  });
}