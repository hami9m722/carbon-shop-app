import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';
import 'package:carbon_credit_trading/widgets/filter_drawer.dart';
import 'package:carbon_credit_trading/widgets/project_item.dart';
import 'package:flutter/material.dart';

// favorite project (name, price, first project image)

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  final FocusNode _searchFocusNode = FocusNode();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isRedSelected = true;
  bool isWhiteSelected = false;
  bool isBlueSelected = false;

  String _searchQuery = '';
  bool _isSearching = false;

  String selectedPaymentMethod = '';
  String selectedRating = '';
  double selectedMinPrice = 0;
  double selectedMaxPrice = 0;

  String _sortOption = 'Giá tăng dần';

  // TODO: read projects from API
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
      company: null,
      companyUser: null,
      price: '800',
      projectImages: [
      ],
      paymentMethods: ['Chuyển khoản', 'Tiền mặt'],
      status: 'approved',
    ),
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
      company: null,
      companyUser: null,
      certificates: 'ISO 14001',
      price: '1000',
      projectImages: [],
      paymentMethods: ['Thẻ tín dụng', 'Tiền mặt'],
      status: 'approved',
    ),
  ];

  void _sortProjects() {
    setState(() {
      if (_sortOption == 'Giá tăng dần') {
        projects.sort(
            (a, b) => double.parse(a.price).compareTo(double.parse(b.price)));
      } else if (_sortOption == 'Giá giảm dần') {
        projects.sort(
            (a, b) => double.parse(b.price).compareTo(double.parse(a.price)));
      } else if (_sortOption == 'Đánh giá tăng dần') {
        // Assuming you have ratings, replace this with actual sorting logic
        // projects.sort((a, b) => a.rating.compareTo(b.rating));
      } else if (_sortOption == 'Đánh giá giảm dần') {
        // Assuming you have ratings, replace this with actual sorting logic
        // projects.sort((a, b) => b.rating.compareTo(a.rating));
      }
    });
  }

  List<Project> getFilteredProjects(List<Project> projects) {
    return projects.where((project) {
      bool matchesSearchQuery = project.projectName
          .toLowerCase()
          .contains(_searchQuery.trim().toLowerCase());
      // bool matchesPriceRange =
      //     double.parse(project.price) >= selectedMinPrice &&
      //         double.parse(project.price) <= selectedMaxPrice;
      // bool matchesPaymentMethod =
      //     project.paymentMethods.contains(selectedPaymentMethod);
      // bool matchesRating =
      //     project.rating == selectedRating; // Assuming rating is available

      return matchesSearchQuery;
      // && matchesPriceRange &&
      //     matchesPaymentMethod &&
      //     matchesRating;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredProjects = getFilteredProjects(projects);
    return Scaffold(
      key: _scaffoldKey,
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
                'Yêu thích',
                style: AppTextStyles.heading,
              ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              children: [
                TextButton(
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
                Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: const Icon(
                        Icons.filter_list,
                        color: AppColors.greenButton,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
          color: AppColors.greyBackGround,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _sortOption = _sortOption == 'Giá tăng dần'
                          ? 'Giá giảm dần'
                          : 'Giá tăng dần';
                    });
                    _sortProjects();
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: AppColors.greenButton, width: 2),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'Giá',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.greenButton,
                          ),
                        ),
                        Icon(
                          _sortOption == 'Giá tăng dần'
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          color: AppColors.greenButton,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: AppColors.greenButton, width: 2)),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Đánh giá',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.greenButton,
                        ),
                      ),
                      Icon(
                        Icons.arrow_upward,
                        color: AppColors.greenButton,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
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
                      )),
          ])),
      endDrawer: FilterDrawer(
        onApplyFilters: (filters) {},
      ),
    );
  }
}
