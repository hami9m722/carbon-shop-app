import 'package:carbon_credit_trading/extensions/dto.dart';
import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/services/service.dart';

import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';

import 'package:carbon_credit_trading/widgets/project_item.dart';

import 'package:flutter/material.dart';

// approved projects (name, price, first project image)

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
    Future<List<Project>> getFilteredProjects() async {
      try {
        final pagedProjectDTO = businessOption == BusinessOption.mediator
            ? await mediatorAuditControllerApi.viewAllProject2(
                status: 'INIT', filter: _searchQuery)
            : await sellerControllerApi.viewAllProject1(
                status: 'INIT', filter: _searchQuery);

        if (pagedProjectDTO != null) {
          return await Future.wait(pagedProjectDTO.content
              .map((projectData) => projectData.toProject()));
        } else {
          return [];
        }
      } catch (e) {
        print("Error fetching projects: $e");
        return [];
      }
    }

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
                  'Không có dự án nào đang chờ duyệt',
                  style: AppTextStyles.normalText,
                ),
              );
            } else {
              final filteredProjects = snapshot.data!;
              return Column(
                children: [
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
                          previousPage: widget.previousPage,
                          searchQuery: widget.previousPage != ''
                              ? _searchQuery
                              : widget.searchQuery,
                          onChanged: () {
                            setState(() {});
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
