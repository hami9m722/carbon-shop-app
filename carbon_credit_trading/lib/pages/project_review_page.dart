import 'package:carbon_credit_trading/pages/project_approved_tab.dart';
import 'package:carbon_credit_trading/pages/project_canceled_tab.dart';
import 'package:carbon_credit_trading/pages/project_pending_tab.dart';
import 'package:flutter/material.dart';

class ProjectReviewPage extends StatefulWidget {
  const ProjectReviewPage({super.key});

  @override
  createState() => _ProjectReviewPage();
}

class _ProjectReviewPage extends State<ProjectReviewPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tìm kiếm'),
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
                  _buildFilterButton(0, 'Đang duyệt', Colors.green),
                  const SizedBox(width: 5),
                  _buildFilterButton(1, 'Đã hoàn thành', Colors.green),
                  const SizedBox(width: 5),
                  _buildFilterButton(2, 'Đã hủy', Colors.green),
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
              children: const [
                ProjectPendingTab(),
                ProjectApprovedTab(),
                ProjectCanceledTab()
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
