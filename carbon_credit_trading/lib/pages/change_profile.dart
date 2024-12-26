import 'dart:io';

import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/services/check_validate.dart';
import 'package:carbon_credit_trading/services/service.dart';
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
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController taxCodeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController businessFieldController = TextEditingController();
  final TextEditingController representativeController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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

  void _changeProfile() {
    // TODO: Implement change profile logic
  }

  Future<List<dynamic>> _fetchData() async {
    try {
      // Ensure `currentUserId` is defined
      if (currentUserId == null) throw Exception("User ID is null");
      var appUser = await userControllerApi.viewUser(currentUserId!);
      var company = await userControllerApi.viewCompany(appUser!.company!);
      return [appUser, company];
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: FutureBuilder<List<dynamic>>(
        future: _fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
                child: Text('Có lỗi xảy ra khi tải thông tin doanh nghiệp'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Không có thông tin doanh nghiệp'));
          } else {
            final data = snapshot.data!;
            final appUser = data[0] as AppUserDTO;
            final company = data[1] as CompanyDTO;

            return Container(
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
                                          'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Thông tin doanh nghiệp",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Tên doanh nghiệp',
                        border: OutlineInputBorder(),
                      ),
                      controller: companyNameController,
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      controller: emailController,
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: "Mã số thuế",
                        border: OutlineInputBorder(),
                      ),
                      controller: taxCodeController,
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Địa chỉ',
                        border: OutlineInputBorder(),
                      ),
                      controller: addressController,
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Ngành nghề kinh doanh',
                        border: OutlineInputBorder(),
                      ),
                      controller: businessFieldController,
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      "Thông tin người đại diện",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Người đại diện',
                        border: OutlineInputBorder(),
                      ),
                      controller: representativeController,
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Số điện thoại',
                        border: OutlineInputBorder(),
                      ),
                      controller: phoneController,
                    ),
                    const SizedBox(height: 15),
                    if (errorMessage != null)
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          errorMessage!,
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        onPressed: _changeProfile,
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
            );
          }
        },
      ),
    );
  }
}
