import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/pages/buyer_page.dart';
import 'package:carbon_credit_trading/pages/seller_page.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/custom_menu_widget.dart';
import 'package:flutter/material.dart';

// not use api
class BusinessOptionsPage extends StatelessWidget {
  const BusinessOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey userInfoKey = GlobalKey();

    return Scaffold(
      appBar: const CustomAppBar(title: "Chọn kênh"),
      body: FutureBuilder<AppUserDTO?>(
        future: userControllerApi.viewUser(currentUserId!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Có lỗi xảy ra khi tải thông tin người dùng'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('Không có thông tin người dùng'),
            );
          } else {
            final appUser = snapshot.data!;
            return Container(
              color: AppColors.greyBackGround,
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    key: userInfoKey,
                    onTap: () {
                      RenderBox renderBox = userInfoKey.currentContext!
                          .findRenderObject() as RenderBox;
                      Offset offset = renderBox.localToGlobal(Offset.zero);
                      double left = offset.dx;
                      double top = offset.dy + renderBox.size.height;

                      CustomMenuWidget.showCustomMenu(context,
                          left: left, top: top);
                    },
                    child: Container(
                      color: AppColors.greyBackGround,
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey[400],
                            child: const Icon(Icons.person, size: 30),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  appUser.name ?? 'N/A',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  appUser.email ?? 'N/A',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: TextButton(
                            onPressed: () {
                              businessOption = BusinessOption.seller;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SellerPage(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.greenButton,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text(
                              'Kênh người bán',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: TextButton(
                            onPressed: () {
                              businessOption = BusinessOption.buyer;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BuyerPage(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.greenButton,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text(
                              'Kênh người mua',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
