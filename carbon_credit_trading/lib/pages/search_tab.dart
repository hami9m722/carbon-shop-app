import 'package:carbon_credit_trading/extensions/dto.dart';
import 'package:carbon_credit_trading/extensions/search.dart';
import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';
import 'package:carbon_credit_trading/widgets/project_item.dart';
import 'package:flutter/material.dart';

// all approved project (name, price, first project image)

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final FocusNode _searchFocusNode = FocusNode();
  String _searchQuery = '';
  bool _isSearching = false;

  Future<List<Project>> _getProjects() async {
    var paged = await buyerControllerApi.viewAllProject3(
        status: 'APPROVED', filter: _searchQuery);
    return Future.wait((await buyerControllerApi.viewAllProject3(
            status: 'APPROVED', filter: _searchQuery))!
        .content
        .map((dto) => dto.toProject()));
  }

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
                  hintText: 'Tìm dự án...',
                ),
              )
            : const Text(
                'Tìm kiếm',
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
                      style:
                          TextStyle(color: AppColors.greenButton, fontSize: 16),
                    )
                  : const Icon(
                      Icons.search,
                      color: AppColors.greenButton,
                    ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Project>>(future: () async {
        return Future.wait((await buyerControllerApi.viewAllProject3(
                status: 'APPROVED', filter: _searchQuery))!
            .content
            .map((dto) => dto.toProject()));
      }(), builder: (context, snapshot) {
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
          ));
        } else {
          var filteredProjects =
              snapshot.data?.toList().search(_searchQuery) ?? [];
          return Container(
            color: AppColors.greyBackGround,
            child: filteredProjects.isEmpty
                ? const Center(
                    child: Text(
                      'Không có dự án nào',
                      style: AppTextStyles.normalText,
                    ),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: filteredProjects.length,
                    itemBuilder: (context, index) {
                      final project = filteredProjects[index];
                      return ProjectItem(
                        project: project,
                        searchQuery: _searchQuery,
                      );
                    },
                  ),
          );
        }
      }),
    );
  }
}
