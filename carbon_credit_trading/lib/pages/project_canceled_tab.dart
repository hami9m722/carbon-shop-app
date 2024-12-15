import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/services/service.dart';

import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';

import 'package:carbon_credit_trading/widgets/project_item.dart';

import 'package:flutter/material.dart';

class ProjectCanceledTab extends StatelessWidget {
  final String? searchQuery;
  const ProjectCanceledTab({super.key, this.searchQuery});

  @override
  Widget build(BuildContext context) {
    Future<List<Project>> getFilteredProjects() async {
      try {
        final pagedProjectDTO = await sellerControllerApi.viewAllProject1('');

        if (pagedProjectDTO != null) {
          return pagedProjectDTO.content.map((projectData) {
                return Project(
                  projectName: projectData.name ?? '',
                  startDate: projectData.timeStart?.year.toString() ??
                      DateTime.now().year.toString(),
                  endDate: projectData.timeEnd?.year.toString() ??
                      DateTime.now().year.toString(),
                  location: projectData.address ?? '',
                  scale: projectData.size ?? '',
                  scope: projectData.produceCarbonRate ?? '',
                  partners: projectData.partner ?? '',
                  issuer: projectData.auditByOrg ?? '',
                  availableCredits: (projectData.creditAmount != null)
                      ? projectData.creditAmount.toString()
                      : '0',
                  certificates: projectData.cert ?? '',
                  price: projectData.price ?? '0',
                  projectImages:
                      List<String>.from(projectData.projectImages ?? []),
                  //creditImages: List<String>.from(projectData.creditImages ?? []),
                  paymentMethods: List<String>.from(
                      projectData.methodPayment?.split(',') ?? []),
                  //status: projectData.status ?? '',
                  //rating: projectData.rating,
                );
              }).toList() ??
              [];
        } else {
          return [];
        }
      } catch (e) {
        print("Error fetching projects: $e");
        return [];
      }
    }

    return Scaffold(
      body: Container(
        color: AppColors.greyBackGround,
        child: FutureBuilder<List<Project>>(
          future: getFilteredProjects(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Có lỗi xảy ra khi tải dự án'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  'Không có dự án nào bị hủy',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: AppTextStyles.normalText,
                ),
              );
            } else {
              final filteredProjects = snapshot.data!;
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: filteredProjects.length,
                itemBuilder: (context, index) {
                  final project = filteredProjects[index];
                  return ProjectItem(
                    project: project,
                    searchQuery: searchQuery,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
