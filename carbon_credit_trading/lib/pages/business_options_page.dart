import 'package:carbon_credit_trading/pages/seller_page.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class BusinessOptionsPage extends StatelessWidget {
  const BusinessOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          appBar: const CustomAppBar(title: "Chọn kênh"),
          body: Container(
            color: AppColors.greyBackGround,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
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
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BusinessOptionsPage(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.greenButton,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Kênh người mua',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
