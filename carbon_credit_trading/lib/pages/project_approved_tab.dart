import 'package:carbon_credit_trading/models/project.dart';

import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';

import 'package:carbon_credit_trading/widgets/project_item.dart';

import 'package:flutter/material.dart';

class ProjectApprovedTab extends StatelessWidget {
  final String? searchQuery;
  const ProjectApprovedTab({super.key, this.searchQuery});

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
          creditImages: [],
          paymentMethods: ['Chuyển khoản', 'Tiền mặt'],
          status: 'approved'),
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
          paymentMethods: ['Thẻ tín dụng', 'Tiền mặt'],
          status: 'approved'),
    ];

    List<Project> getFilteredTransactions(List<Project> transactions) {
      return projects.where((project) {
        return project.projectName.contains(searchQuery?.trim() ?? '');
      }).toList();
    }

    final filteredProjects = getFilteredTransactions(projects);

    return Scaffold(
      body: Container(
        color: AppColors.greyBackGround,
        child: filteredProjects.isEmpty
            ? const Center(
                child: Text(
                'Không có dự án nào đang chờ duyệt',
                textAlign: TextAlign.center,
                softWrap: true,
                style: AppTextStyles.normalText,
              ))
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: filteredProjects.length,
                itemBuilder: (context, index) {
                  final project = filteredProjects[index];
                  return ProjectItem(
                    project: project,
                    searchQuery: searchQuery,
                  );
                },
              ),
      ),
    );
  }
}
