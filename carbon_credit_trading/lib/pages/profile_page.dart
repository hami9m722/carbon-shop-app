import 'package:carbon_credit_trading/pages/change_pass.dart';
import 'package:carbon_credit_trading/pages/change_profile.dart';
import 'package:carbon_credit_trading/theme/custom_appbar.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/custom_ricktext.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Thông tin doanh nghiệp'),
      body: Container(
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
                  border: Border.all(color: Colors.grey[300]!, width: 1),
                ),
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Hình đại diện lớn và ở giữa
                        const Center(
                          // Căn giữa
                          child: CircleAvatar(
                            radius: 50, // Kích thước hình đại diện
                            backgroundColor: Color.fromARGB(255, 200, 200,
                                200), // Màu nền của hình đại diện
                            child: Icon(Icons.person,
                                size: 50), // Kích thước icon lớn hơn
                          ),
                        ),
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
                              fontSize: 17, fontStyle: FontStyle.italic),
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
              ),
            ),
            // Các nút sẽ luôn nằm dưới cùng
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
                            builder: (context) => const ChangeProfilePage(),
                          ),
                        )
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.greenButton,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        'Thay đổi thông tin',
                        style: TextStyle(color: Colors.white, fontSize: 16),
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
                            builder: (context) => const ChangePassPage(),
                          ),
                        )
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.greenButton,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        'Đổi mật khẩu',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
