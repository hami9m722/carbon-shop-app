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
                        _buildRichText('Tên doanh nghiệp:',
                            'Renewable Biomass Energy Ventures'),
                        const SizedBox(height: 20),
                        _buildRichText('Mã số thuế:', '1029384756'),
                        const SizedBox(height: 20),
                        _buildRichText('Địa chỉ:', 'Jakarta, Indonesia'),
                        const SizedBox(height: 20),
                        _buildRichText('Ngành nghề kinh doanh:',
                            'Năng lượng sinh khối và tái tạo'),
                        const SizedBox(height: 20),
                        _buildRichText('Email:', 'andi@renewablebiomass.id'),
                        const SizedBox(height: 20),
                        const Text(
                          'Thông tin người đại diện:',
                          style: TextStyle(
                              fontSize: 17, fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 10),
                        _buildRichText('Họ và tên:', 'Andi Pratama'),
                        const SizedBox(height: 10),
                        _buildRichText('Số điện thoại:', '+62 21 987 6543'),
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
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/change_pass')},
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

  // Hàm giúp xây dựng RichText cho các hàng thông tin
  Widget _buildRichText(String title, String value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              fontWeight: FontWeight.bold, // In đậm cho chỉ mục
              fontSize: 21,
              color: Colors.black, // Màu chữ
            ),
          ),
          const TextSpan(text: ' '), // Khoảng cách giữa chỉ mục và giá trị
          TextSpan(
            text: value,
            style: const TextStyle(
              fontSize: 21, // Không in đậm
              color: Colors.black, // Màu chữ
            ),
          ),
        ],
      ),
    );
  }
}
