import 'dart:io';

import 'package:carbon_credit_trading/services/check_validate.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChangeProfilePage extends StatefulWidget {
  const ChangeProfilePage({super.key});
  @override
  createState() => _ChangeProfilePageState();
}

class _ChangeProfilePageState extends State<ChangeProfilePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController companyNameController =
      TextEditingController(text: "companyName");
  String? errorMessage;
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  void _changProfile() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
            child: Container(
          color: AppColors.greyBackGround,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: _pickImage,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50),
                            image: _image != null
                                ? DecorationImage(
                                    image: FileImage(_image!),
                                    fit: BoxFit.cover,
                                  )
                                : const DecorationImage(
                                    image: NetworkImage(
                                        'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'), //change
                                    fit: BoxFit.cover,
                                  ),
                          )),
                    ),
                  ),
                ),
                const Text(
                  "Thông tin doanh nghiệp",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                // Custom Email Field
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Tên doanh nghiệp',
                    border: OutlineInputBorder(),
                  ),
                  controller: companyNameController,
                ),
                const SizedBox(height: 15),
                TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => Validators.validateEmail(value)),
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                      labelText: "Mã số thuế", border: OutlineInputBorder()),
                ),
                // Custom Password Field
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Địa chỉ',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Ngành nghề kinh doanh',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "Thông tin người đại diện",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Người đại diện',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Số điện thoại',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                if (errorMessage != null)
                  Container(
                    width: double
                        .infinity, // ensure container width equal to window's width
                    alignment: Alignment.center,
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                const SizedBox(height: 10),
                // Đăng nhập Button
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: _changProfile,
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.greenButton,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Lưu',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
