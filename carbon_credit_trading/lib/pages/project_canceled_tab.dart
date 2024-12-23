import 'package:carbon_credit_trading/extensions/dto.dart';
import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/services/service.dart';

import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';

import 'package:carbon_credit_trading/widgets/project_item.dart';

import 'package:flutter/material.dart';

// canceledcanceled projects (name, price, first project image)

class ProjectCanceledTab extends StatefulWidget {
  final String? searchQuery;
  const ProjectCanceledTab({super.key, this.searchQuery});

  @override
  State<ProjectCanceledTab> createState() => _ProjectCanceledTabState();
}

class _ProjectCanceledTabState extends State<ProjectCanceledTab> {
  @override
  Widget build(BuildContext context) {
    Future<List<Project>> getFilteredProjects() async {
      try {
        final pagedProjectDTO =
            await sellerControllerApi.viewAllProject1(status: 'REJECTED', filter: widget.searchQuery);

        if (pagedProjectDTO != null) {
          return await Future.wait(pagedProjectDTO.content.map((projectData) {
            return projectData.toProject();
          }));
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
        child: FutureBuilder(
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
                    searchQuery: widget.searchQuery,
                    onChanged: () {
                      setState(() {});
                    },
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
