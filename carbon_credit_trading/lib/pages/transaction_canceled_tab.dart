import 'package:carbon_credit_trading/extensions/search.dart';
import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';
import 'package:carbon_credit_trading/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionCanceledTab extends StatefulWidget {
  final String? searchQuery;

  const TransactionCanceledTab({super.key, this.searchQuery});

  @override
  createState() => _TransactionCanceledTabState();
}

class _TransactionCanceledTabState extends State<TransactionCanceledTab> {
  bool _isSearching = false;
  String _searchQuery = '';
  final FocusNode _searchFocusNode = FocusNode();

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
          future: transactionService.getCancelledTransactions(),
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
                        'Không có giao dịch đã hủy',
                        style: AppTextStyles.normalText,
                      ),
                    )
                  : Column(
                      children: [
                        if (businessOption == 'seller')
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'Các giao dịch đã hủy',
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
