import 'package:carbon_credit_trading/models/project.dart';

import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';

import 'package:carbon_credit_trading/widgets/project_item.dart';

import 'package:flutter/material.dart';

class ProjectPendingTab extends StatefulWidget {
  final String previousPage;
  final String? searchQuery;

  const ProjectPendingTab({
    super.key,
    this.previousPage = '',
    this.searchQuery,
  });

  @override
  createState() => _ProjectPendingTabState();
}

class _ProjectPendingTabState extends State<ProjectPendingTab> {
  bool _isSearching = false;
  String _searchQuery = '';
  final FocusNode _searchFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final List<Project> projects = [
      Project(
          projectName: 'Dự án năng lượng sinh khối từ rác thải nông nghiệp',
          startDate: '01/01/2023',
          endDate: '01/01/2025',
          location: 'Việt Nam',
          scale: 'Lớn',
          scope: 'Toàn quốc',
          partners: 'Công ty ABC',
          issuer: 'Chính phủ',
          availableCredits: '1000',
          certificates: 'ISO 9001',
          price: '1000',
          projectImages: [
            'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'
          ],
          creditImages: [
            'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'
          ],
          paymentMethods: ['Thẻ tín dụng', 'Chuyển khoản nội địa'],
          status: 'pending'),
      Project(
          projectName: 'Dự án năng lượng mặt trời',
          startDate: '01/06/2023',
          endDate: '01/06/2024',
          location: 'Việt Nam',
          scale: 'Trung bình',
          scope: 'Khu vực miền Trung',
          partners: 'Công ty XYZ',
          issuer: 'Công ty TNHH',
          availableCredits: '500',
          certificates: 'ISO 14001',
          price: '800',
          projectImages: ['https://via.placeholder.com/150'],
          creditImages: [],
          paymentMethods: ['Thẻ tín dụng', 'Chuyển khoản nội địa'],
          status: 'pending'),
    ];

    List<Project> getFilteredTransactions(List<Project> transactions) {
      final searchQuery = widget.previousPage != ''
          ? _searchQuery.trim()
          : widget.searchQuery?.trim() ?? '';
      return projects.where((project) {
        return project.projectName.contains(searchQuery);
      }).toList();
    }

    final filteredProjects = getFilteredTransactions(projects);

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
                        hintText: 'Tìm dự án...',
                      ),
                    )
                  : const Text(
                      'Dự án',
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
      body: Container(
        color: AppColors.greyBackGround,
        child: filteredProjects.isEmpty
            ? const Center(
                child: Text(
                'Không có dự án nào đang chờ duyệt',
                style: AppTextStyles.normalText,
              ))
            : Column(children: [
                if (widget.previousPage != '')
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Các dự án đang chờ duyệt',
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
                  itemCount: filteredProjects.length,
                  itemBuilder: (context, index) {
                    final project = filteredProjects[index];
                    return ProjectItem(
                      project: project,
                      searchQuery: widget.previousPage != ''
                          ? _searchQuery
                          : widget.searchQuery,
                    );
                  },
                ))
              ]),
      ),
    );
  }
}
