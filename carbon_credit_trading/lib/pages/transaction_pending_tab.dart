import 'package:carbon_credit_trading/extensions/search.dart';
import 'package:carbon_credit_trading/pages/approve_transaction_page.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';
import 'package:carbon_credit_trading/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

/* pending order info
 'orderId': order.orderId,
  //             'creditAmount': order.creditAmount,
  //             'total': order.total,
  //             'paymentBillFile': order.paymentBillFile,
  //             'contractFile': order.contractFile,
  //             'certImages': order.certImages,
  //             'buyer': buyer (companyName, taxCode,address),
                  'seller': seller (companyName, tatCode, address),
  //             'project': project infoinfo,
  //             'status': order.status
*/

class TransactionPendingTab extends StatefulWidget {
  final String previousPage;
  final String? searchQuery;

  const TransactionPendingTab(
      {super.key, this.previousPage = '', this.searchQuery});

  @override
  createState() => _TransactionPendingTabState();
}

class _TransactionPendingTabState extends State<TransactionPendingTab> {
  bool _isSearching = false;
  String _searchQuery = '';
  final FocusNode _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.previousPage != ''
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
        future: transactionService.getPendingTransactions(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final filteredTransactions = snapshot.requireData!;
          return Container(
            color: AppColors.greyBackGround,
            child: filteredTransactions.isEmpty
                ? const Center(
                    child: Text(
                      'Không có giao dịch nào đang chờ duyệt',
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: AppTextStyles.normalText,
                    ),
                  )
                : Column(
                    children: [
                      if (widget.previousPage.isNotEmpty)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'Các giao dịch đang chờ duyệt',
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
                              searchQuery: widget.previousPage != ''
                                  ? _searchQuery
                                  : widget.searchQuery,
                              onPress: widget.previousPage == 'intermediary'
                                  ? () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ApproveTransactionPage(
                                                  transaction: transaction),
                                        ),
                                      );
                                    }
                                  : null,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
