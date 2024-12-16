import 'package:carbon_credit_trading/pages/question_approved_page.dart';
import 'package:carbon_credit_trading/pages/question_pending_tab.dart';
import 'package:carbon_credit_trading/pages/transaction_approved_tab.dart';
import 'package:carbon_credit_trading/pages/transaction_canceled_tab.dart';
import 'package:carbon_credit_trading/pages/transaction_pending_tab.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';
import 'package:flutter/material.dart';

class IntermediaryQuestionPage extends StatefulWidget {
  const IntermediaryQuestionPage({super.key});

  @override
  createState() => _IntermediaryQuestionPageState();
}

class _IntermediaryQuestionPageState extends State<IntermediaryQuestionPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool _isSearching = false;
  String _searchQuery = '';
  final FocusNode _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  hintText: 'Tìm câu hỏi...',
                ),
              )
            : const Text(
                'Câu hỏi',
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
                    ? const Text('Hủy',
                        style: TextStyle(
                            color: AppColors.greenButton, fontSize: 16))
                    : const Icon(
                        Icons.search,
                        color: AppColors.greenButton,
                      ),
              )),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildFilterButton(0, 'Chờ duyệt', Colors.green),
                  const SizedBox(width: 5),
                  _buildFilterButton(1, 'Đã hoàn thành', Colors.green),
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                QuestionPendingTab(searchQuery: _searchQuery),
                QuestionApprovedTab(searchQuery: _searchQuery),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(int index, String text, Color color) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _currentIndex == index ? color : Colors.grey,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              color: _currentIndex == index ? color : Colors.transparent,
            ),
          ),
        ),
        onPressed: () {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
        child: Center(
          child: Text(text, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
