import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/pages/change_pass.dart';
import 'package:carbon_credit_trading/pages/change_profile.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/custom_ricktext.dart';
import 'package:flutter/material.dart';

//no use
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Thông tin doanh nghiệp'),
      body: FutureBuilder<List<dynamic>>(
          future: () async {
            var appUser = await userControllerApi.viewUser(currentUserId!);
            return Future.any<dynamic>([
              Future.value(appUser),
              userControllerApi.viewCompany(appUser!.company!)
            ]);
          } as Future<List<dynamic>>?,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(
                  child: Text('Có lỗi xảy ra khi tải thông tin doanh nghiệp'));
            } else if (!snapshot.hasData) {
              return const Center(
                  child: Text('Không có thông tin doanh nghiệp'));
            } else {
              final data = snapshot.data!;
              final appUser = data[0] as AppUserDTO;
              final company = data[1] as CompanyDTO;
              return Container(
                color: AppColors.greyBackGround,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Màu nền của container
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                          border:
                              Border.all(color: Colors.grey[300]!, width: 1),
                        ),
                        margin: const EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Center(
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor:
                                        Color.fromARGB(255, 200, 200, 200),
                                    child: Icon(Icons.person, size: 50),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                customRichText(
                                  title: 'Tên doanh nghiệp:',
                                  value: company.name!,
                                ),
                                const SizedBox(height: 20),
                                customRichText(
                                  title: 'Mã số thuế:',
                                  value: company.taxCode!,
                                ),
                                const SizedBox(height: 20),
                                customRichText(
                                  title: 'Địa chỉ:',
                                  value: company.address!,
                                ),
                                const SizedBox(height: 20),
                                customRichText(
                                  title: 'Ngành nghề kinh doanh:',
                                  value: company.industry!,
                                ),
                                const SizedBox(height: 20),
                                customRichText(
                                  title: 'Email:',
                                  value: company.email!,
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
                                  value: appUser.name!,
                                ),
                                const SizedBox(height: 10),
                                customRichText(
                                  title: 'Số điện thoại:',
                                  value: appUser.phone!,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 18),
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: TextButton(
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ChangeProfilePage(),
                                  ),
                                )
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.greenButton,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: const Text(
                                'Thay đổi thông tin',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: TextButton(
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ChangePassPage(),
                                  ),
                                )
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.greenButton,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: const Text(
                                'Đổi mật khẩu',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
