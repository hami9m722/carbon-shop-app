import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/project_item.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Yêu thích",
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          ProjectItem(
              title: 'Dự án năng lượng sinh khối từ rác thải nông nghiệp',
              subtitle: 15,
              imageUrl:
                  'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
          ProjectItem(
              title: 'Dự án năng lượng sinh khối từ rác thải nông nghiệp',
              subtitle: 11,
              imageUrl: 'https://via.placeholder.com/150'),
          ProjectItem(
              title: 'Dự án năng lượng sinh khối từ rác thải nông nghiệp',
              subtitle: 13,
              imageUrl: 'https://via.placeholder.com/150'),
          ProjectItem(
              title: 'Dự án năng lượng sinh khối từ rác thải nông nghiệp',
              subtitle: 10,
              imageUrl: 'https://via.placeholder.com/150'),
        ],
      ),
    );
  }
}
