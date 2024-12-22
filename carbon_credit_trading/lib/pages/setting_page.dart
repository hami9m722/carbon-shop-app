import 'package:carbon_credit_trading/pages/change_pass.dart';
import 'package:carbon_credit_trading/pages/change_profile.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

//not use apiapi

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _pushNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Cài đặt",
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.greyBackGround,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text(
              //   'Cài đặt tài khoản',
              //   style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              // ),
              //const SizedBox(height: 15),
              _buildSettingTile(
                context,
                'Chỉnh sửa hồ sơ',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangeProfilePage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              _buildSettingTile(
                context,
                'Đổi mật khẩu',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangePassPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              // const Text(
              //   'Cài đặt khác',
              //   style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              // ),
              // const SizedBox(height: 15),
              // _buildSwitchTile(
              //   'Thông báo',
              //   _pushNotifications,
              //   (bool newValue) {
              //     setState(() {
              //       _pushNotifications = newValue;
              //     });
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingTile(
      BuildContext context, String title, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSwitchTile(
      String title, bool value, ValueChanged<bool> onChanged) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SwitchListTile(
        title: Text(title),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
