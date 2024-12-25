import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/models/comment.dart';
import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/custom_menu_widget.dart';
import 'package:carbon_credit_trading/widgets/custom_ricktext.dart';
import 'package:carbon_credit_trading/widgets/feedback_item.dart';
import 'package:carbon_credit_trading/widgets/project_item.dart';
import 'package:flutter/material.dart';
import 'package:carbon_credit_trading/extensions/dto.dart';

class BusinessDetailPage extends StatelessWidget {
  const BusinessDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey userInfoKey = GlobalKey();

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Trang cá nhân",
        color: AppColors.greyBackGround,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: Future.wait([
          () async {
            if (currentUserId == null) throw Exception("User ID is null");
            var appUser = await userControllerApi.viewUser(currentUserId!);
            var company =
                await userControllerApi.viewCompany(appUser!.company!);
            return [appUser, company];
          }(),
          () async {
            final pagedProjectDTO =
                await sellerControllerApi.viewAllProject1(status: 'APPROVED');
            if (pagedProjectDTO != null) {
              return await Future.wait(
                  pagedProjectDTO.content.map((projectData) {
                return projectData.toProject();
              }));
            } else {
              return [];
            }
          }()
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final businessInfo = snapshot.data![0];
            final projects = snapshot.data![1] as List<Project>;

            return Container(
              color: AppColors.greyBackGround,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 70),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20),
                                  customRichText(
                                    title: 'Tên doanh nghiệp:',
                                    value: 'Renewable Biomass Energy Ventures',
                                  ),
                                  const SizedBox(height: 20),
                                  customRichText(
                                    title: 'Mã số thuế:',
                                    value: '1029384756',
                                  ),
                                  const SizedBox(height: 20),
                                  customRichText(
                                    title: 'Địa chỉ:',
                                    value: 'Jakarta, Indonesia',
                                  ),
                                  const SizedBox(height: 20),
                                  customRichText(
                                    title: 'Ngành nghề kinh doanh:',
                                    value: 'Năng lượng sinh khối và tái tạo',
                                  ),
                                  const SizedBox(height: 20),
                                  customRichText(
                                    title: 'Email:',
                                    value: 'andi@renewablebiomass.id',
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Thông tin người đại diện:',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  const SizedBox(height: 10),
                                  customRichText(
                                    title: 'Họ và tên:',
                                    value: 'Andi Pratama',
                                  ),
                                  const SizedBox(height: 10),
                                  customRichText(
                                    title: 'Số điện thoại:',
                                    value: '+62 21 987 6543',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 5,
                            left: 20,
                            child: GestureDetector(
                              key: userInfoKey,
                              onTap: () {
                                RenderBox renderBox = userInfoKey
                                    .currentContext!
                                    .findRenderObject() as RenderBox;
                                Offset offset =
                                    renderBox.localToGlobal(Offset.zero);

                                double top = offset.dy + renderBox.size.height;

                                CustomMenuWidget.showCustomMenu(context,
                                    left: 0,
                                    top: top + 10,
                                    isBusinessDetailPage: true);
                              },
                              child: const CircleAvatar(
                                radius: 50,
                                backgroundColor:
                                    Color.fromARGB(255, 200, 200, 200),
                                child: Icon(Icons.person, size: 40),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Danh sách dự án đăng bán",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        final project = projects[index];
                        return ProjectItem(
                          project: project,
                          onChanged: () {},
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
