import 'package:carbon_credit_trading/pages/business_detail_page.dart';
import 'package:carbon_credit_trading/pages/setting_page.dart';
import 'package:carbon_credit_trading/pages/login_page.dart';
import 'package:flutter/material.dart';

class CustomMenuWidget {
  static Future<void> showCustomMenu(BuildContext context,
      {double left = 0,
      double top = 0,
      bool isBusinessDetailPage = false}) async {
    await showMenu(
      context: context,
      color: Colors.green[50],
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        if (!isBusinessDetailPage)
          PopupMenuItem(
            padding: EdgeInsets.zero,
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const BusinessDetailPage(),
                  ));
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  overlayColor: Colors.black,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person_2_outlined,
                    ),
                    SizedBox(width: 8),
                    Text("Xem trang cá nhân"),
                  ],
                ),
              ),
            ),
          ),
        PopupMenuItem(
          padding: EdgeInsets.zero,
          child: SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                overlayColor: Colors.black,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.settings,
                  ),
                  SizedBox(width: 8),
                  Text("Cài đặt"),
                ],
              ),
            ),
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.zero,
          child: SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                overlayColor: Colors.black,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.logout,
                  ),
                  SizedBox(width: 8),
                  Text("Đăng xuất"), //TODO: logout function
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
