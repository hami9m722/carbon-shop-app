import 'package:carbon_credit_trading/extensions/search.dart';
import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';
import 'package:carbon_credit_trading/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionApprovedTab extends StatefulWidget {
  final String? searchQuery;

  const TransactionApprovedTab({super.key, this.searchQuery});

  @override
  createState() => _TransactionApprovedTabState();
}

class _TransactionApprovedTabState extends State<TransactionApprovedTab> {
  bool _isSearching = false;
  String _searchQuery = '';
  final FocusNode _searchFocusNode = FocusNode();

  // Future<List<Map<String, dynamic>>> getApprovedOrder() async {
  //   try {
  //     final approvedOrders = await buyerControllerApi.viewAllOrders1();

  //     if (approvedOrders != null) {
  //       List<Map<String, dynamic>> orderList = await Future.wait(
  //         approvedOrders.content.map((order) async {
  //           final project =
  //               await buyerControllerApi.viewProject1(order.orderId!);

  //           final buyer =
  //               await buyerControllerApi.viewCompany1(order.createdBy!);

  //           return {
  //             'orderId': order.orderId,
  //             'creditAmount': order.creditAmount,
  //             'total': order.total,
  //             'paymentBillFile': order.paymentBillFile,
  //             'contractFile': order.contractFile,
  //             'certImages': order.certImages,
  //             'buyer': buyer,
  //             'project': project,
  //             'status': order.status
  //           };
  //         }).toList(),
  //       );

  //       return orderList;
  //     } else {
  //       return [];
  //     }
  //   } catch (e) {
  //     print("Error fetching pending accounts: $e");
  //     return [];
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: businessOption == 'seller'
          ? AppBar(
              centerTitle: true,
              title: _isSearching
                  ? TextField(
                      focusNode: _searchFocusNode,
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Tìm mã giao dịch...',
                      ),
                    )
                  : const Text(
                      'Giao dịch',
                      style: AppTextStyles.heading,
                    ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (_isSearching) {
                          _isSearching = false;
                          _searchQuery = '';
                          _searchFocusNode.unfocus();
                        } else {
                          _isSearching = true;
                          _searchFocusNode.requestFocus();
                        }
                      });
                    },
                    child: _isSearching
                        ? const Text(
                            'Hủy',
                            style: TextStyle(
                                color: AppColors.greenButton, fontSize: 16),
                          )
                        : const Icon(
                            Icons.search,
                            color: AppColors.greenButton,
                          ),
                  ),
                ),
              ],
            )
          : null,
      body: FutureBuilder(
          future: transactionService.getApprovedTransactions(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final searchQuery = businessOption == 'seller'
                ? _searchQuery.trim()
                : widget.searchQuery?.trim() ?? '';
            final filteredTransactions =
                snapshot.requireData.search(searchQuery);
            return Container(
              color: AppColors.greyBackGround,
              child: filteredTransactions.isEmpty
                  ? const Center(
                      child: Text(
                        'Không có giao dịch nào tiến hành thành công',
                        style: AppTextStyles.normalText,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    )
                  : Column(
                      children: [
                        if (businessOption == 'seller')
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'Các giao dịch đã hoàn thành',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: AppColors.greenButton,
                              ),
                            ),
                          ),
                        Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: filteredTransactions.length,
                            itemBuilder: (context, index) {
                              final transaction = filteredTransactions[index];
                              return TransactionItem(
                                transaction: transaction,
                                searchQuery: businessOption == 'seller'
                                    ? _searchQuery
                                    : widget.searchQuery,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
            );
          }),
    );
  }
}
