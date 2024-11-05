import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';
import 'package:carbon_credit_trading/widgets/project_item.dart';
import 'package:flutter/material.dart';

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
  double minPrice = 0;
  double maxPrice = 2400;

  String _searchQuery = '';
  bool _isSearching = false;

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
      certificates: 'ISO 14001',
      price: '800',
      projectImages: ['https://via.placeholder.com/150'],
      paymentMethods: ['Thẻ tín dụng', 'Tiền mặt'],
      status: 'approved',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Project> getFilteredTransactions(List<Project> transactions) {
      return projects.where((project) {
        return project.projectName.contains(_searchQuery.trim());
      }).toList();
    }

    final filteredProjects = getFilteredTransactions(projects);
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
      ),
      endDrawer: _buildFilterDrawer(),
    );
  }

  Widget _buildFilterDrawer() {
    return Container(
      width: 300,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Filters',
            ),
          ),
          const Divider(),
          _buildBrandFilter(),
          const Divider(),
          _buildPriceFilter(),
          const Divider(),
          // Add other filters like Series, Colors here
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle reset action
              },
              child: const Text('Reset All'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandFilter() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Brands'),
          CheckboxListTile(
            title: const Text('Red'),
            value: isRedSelected,
            onChanged: (value) {
              setState(() {
                isRedSelected = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('White'),
            value: isWhiteSelected,
            onChanged: (value) {
              setState(() {
                isWhiteSelected = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Blue'),
            value: isBlueSelected,
            onChanged: (value) {
              setState(() {
                isBlueSelected = value!;
              });
            },
          ),
          // Add more brands as needed
          TextButton(
            onPressed: () {
              // Show more brands action
            },
            child: const Text('Show more brands'),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceFilter() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Price'),
          RangeSlider(
            values: RangeValues(minPrice, maxPrice),
            min: 0,
            max: 2400,
            divisions: 24,
            labels: RangeLabels(
              '\$${minPrice.toInt()}',
              '\$${maxPrice.toInt()}',
            ),
            onChanged: (values) {
              setState(() {
                minPrice = values.start;
                maxPrice = values.end;
              });
            },
          ),
        ],
      ),
    );
  }
}
