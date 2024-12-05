import 'package:flutter/material.dart';
import 'dart:io';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageUploadSection extends StatelessWidget {
  final List<File> imageFiles;
  final Function(File) onRemoveImage;

  const ImageUploadSection({super.key, required this.imageFiles, required this.onRemoveImage});

  void _showFullScreenImage(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.grey[850],
          body: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.dy > 0) {
                Navigator.pop(context);
              }
            },
            child: PhotoViewGallery.builder(
              itemCount: imageFiles.length,
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: FileImage(imageFiles[index]),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 2,
                );
              },
              scrollPhysics: const BouncingScrollPhysics(),
              pageController: PageController(initialPage: index),
            ),
          ),
        ),
      ),
    );
  }

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
                        onTap: () => _showFullScreenImage(context, index),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: FileImage(imageFiles[index]),
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
