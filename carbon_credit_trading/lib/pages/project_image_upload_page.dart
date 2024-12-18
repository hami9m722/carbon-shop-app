import 'dart:io';
import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/image_picker_button.dart';
import 'package:carbon_credit_trading/widgets/image_upload_section.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

//upload project imagesimages

class ProjectImageUploadPage extends StatefulWidget {
  final VoidCallback onPrevious;
  final Function(List<dynamic>) onNext;
  final List<dynamic>? initialImages;

  const ProjectImageUploadPage({
    super.key,
    required this.onPrevious,
    required this.onNext,
    this.initialImages,
  });

  @override
  createState() => _ProjectImageUploadPage();
}

class _ProjectImageUploadPage extends State<ProjectImageUploadPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<dynamic> _imageFiles = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialImages != null) {
      _imageFiles = List.from(widget.initialImages!);
    }
  }

  void _addImage(List<File> newImages) {
    setState(() async {
      _imageFiles.addAll(newImages.whereType<File>().cast<File>());
    });
  }

  void _removeImage(dynamic image) {
    setState(() {
      _imageFiles.remove(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: ImageUploadSection(
                imageFiles: _imageFiles,
                onRemoveImage: _removeImage,
              ),
            ),
            const SizedBox(height: 15),
            ImagePickerButton(
              onImagesSelected: _addImage,
              imageFiles: _imageFiles,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.green[100], // Background color
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload_rounded,
                        color: AppColors.greenButton, size: 35),
                    SizedBox(width: 8),
                    Text(
                      'Đăng tải ảnh dự án',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    widget.onPrevious();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.greenButton,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 28),
                  ),
                  child: const Text(
                    'Trước',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.onNext(_imageFiles); // Pass images back to parent
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.greenButton,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 28),
                  ),
                  child: const Text(
                    'Tiếp theo',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
