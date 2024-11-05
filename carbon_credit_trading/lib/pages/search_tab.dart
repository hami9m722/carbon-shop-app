import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/project_item.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

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
        price: '1000 VND',
        projectImages: [
          'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'
        ],
        creditImages: [],
        paymentMethods: ['Chuyển khoản', 'Tiền mặt'],
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
        price: '800 VND',
        projectImages: ['https://via.placeholder.com/150'],
        creditImages: [],
        paymentMethods: ['Thẻ tín dụng', 'Tiền mặt'],
      ),
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Tìm kiếm",
      ),
      body: Container(
        color: AppColors.greyBackGround,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return ProjectItem(
              title: projects[index].projectName,
              subtitle: projects[index].availableCredits,
              imageUrl: projects[index].projectImages.isNotEmpty
                  ? projects[index].projectImages[0]
                  : 'https://via.placeholder.com/150',
            );
          },
        ),
      ),
    );
  }
}
