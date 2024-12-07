import 'dart:io';

import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddFeedbackPage extends StatefulWidget {
  const AddFeedbackPage({super.key});

  @override
  createState() => _AddFeedbackPageState();
}

class _AddFeedbackPageState extends State<AddFeedbackPage> {
  final List _images = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _addImage() async {
    if (_images.length < 5) {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _images.add(File(image.path));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Đánh Giá Doanh Nghiệp',
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Text(
                  'Đánh giá doanh nghiệp bán:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Doanh nghiệp bán:',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Tên doanh nghiệp: Coastal Mangrove Restoration Initiative',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Mã số thuế: 1122334455',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Địa chỉ: Bangkok, Thái Lan',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Đánh giá của bạn',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Text(
                  'Đánh giá dự án:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thông tin dự án:',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Tên dự án: REDD+ Bảo tồn rừng ngập mặn Thái Lan',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Vị trí: Ven biển Thái Lan',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Quy mô: 20000 ha',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Thời gian: 2021-2041',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Phạm vi: Giảm 60000 tấn CO2/năm, bảo vệ hệ sinh thái ven biển',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Đánh giá của bạn',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          spacing: 8.0,
                          children: _images.isEmpty
                              ? [const Text('Chưa có ảnh nào')]
                              : _images.map((image) {
                                  return SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.file(
                                      image,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                }).toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _addImage();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.greenButton,
                          side:
                              const BorderSide(color: AppColors.greenPopUpText),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 5),
                            const Icon(Icons.camera_alt,
                                color: AppColors.greenButton, size: 35),
                            const SizedBox(height: 5),
                            Text('${_images.length}/5 hình ảnh'),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.greenButton,
                          side:
                              const BorderSide(color: AppColors.greenPopUpText),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.zero, // Set border radius to 0
                          ),
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Icon(
                              Icons.video_call_outlined,
                              color: AppColors.greenButton,
                              size: 35,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Thêm Hình ảnh'),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () => {},
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.greenButton,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Gửi',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
