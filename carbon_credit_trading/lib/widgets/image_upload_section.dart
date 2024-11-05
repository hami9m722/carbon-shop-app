import 'package:carbon_credit_trading/widgets/full_screen_view.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ImageUploadSection extends StatelessWidget {
  final List<dynamic> imageFiles;
  final Function(dynamic) onRemoveImage;

  const ImageUploadSection(
      {super.key, required this.imageFiles, required this.onRemoveImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(8),
      ),
      child: imageFiles.isEmpty
          ? const Center(
              child: Text(
                'Chưa có ảnh nào',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: imageFiles.length,
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      GestureDetector(
                        onTap: () => showFullScreen(context, imageFiles, index),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: imageFiles[index] is File
                                  ? FileImage(imageFiles[index])
                                  : NetworkImage(imageFiles[
                                      index]), // Handle network images
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -10,
                        right: -10,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.cancel, color: Colors.red),
                          onPressed: () => onRemoveImage(imageFiles[index]),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
    );
  }
}
