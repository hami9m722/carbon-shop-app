import 'package:carbon_credit_trading/theme/custome_appbar.dart';
import 'package:flutter/material.dart';
import 'package:carbon_credit_trading/theme/colors.dart';

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
                  color: Colors.white, // Đặt màu nền của container
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
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey[300],
                              child: const Icon(Icons.person, size: 30),
                            ),
                            const SizedBox(width: 20),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Renewable Biomass Energy Ventures',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'andi@renewablebiomass.id',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Tên doanh nghiệp: Renewable Biomass Energy Ventures',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Mã số thuế: 1029384756',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Địa chỉ: Jakarta, Indonesia',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Ngành nghề kinh doanh: Năng lượng sinh khối và tái tạo',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Email: andi@renewablebiomass.id',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Thông tin người đại diện:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Họ và tên: Andi Pratama',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Số điện thoại: +62 21 987 6543',
                          style: TextStyle(fontSize: 16),
                        ),
                        const Text(
                          'Số điện thoại: +62 21 987 6543',
                          style: TextStyle(fontSize: 16),
                        ),
                        const Text(
                          'Số điện thoại: +62 21 987 6543',
                          style: TextStyle(fontSize: 16),
                        ),
                        const Text(
                          'Số điện thoại: +62 21 987 6543',
                          style: TextStyle(fontSize: 16),
                        ),
                        const Text(
                          'Số điện thoại: +62 21 987 6543',
                          style: TextStyle(fontSize: 16),
                        ),
                        const Text(
                          'Số điện thoại: +62 21 987 6543',
                          style: TextStyle(fontSize: 16),
                        ),
                        const Text(
                          'Số điện thoại: +62 21 987 6543',
                          style: TextStyle(fontSize: 16),
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
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/change_profile')},
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
                      onPressed: () => {},
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
