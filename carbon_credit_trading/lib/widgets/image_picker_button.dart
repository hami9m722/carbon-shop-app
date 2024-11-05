import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerButton extends StatefulWidget {
  final Function(List<File>) onImagesSelected;
  final List<dynamic> imageFiles;
  final Widget child;

  const ImagePickerButton({
    super.key,
    required this.onImagesSelected,
    this.imageFiles = const [],
    required this.child,
  });

  @override
  createState() => _ImagePickerButtonState();
}

// Choose many images from library
class _ImagePickerButtonState extends State<ImagePickerButton> {
  Future<void> _pickImagesFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> pickedFiles = await picker.pickMultiImage();

    List<File> newFiles = [];
    int duplicateCount = 0;

    for (var pickedFile in pickedFiles) {
      File newFile = File(pickedFile.path);

      // Check for duplicates
      if (!widget.imageFiles
          .whereType<File>() // Only consider File types
          .any((file) =>
              file.path.split('/').last == newFile.path.split('/').last)) {
        newFiles.add(newFile);
      } else {
        duplicateCount++;
      }
    }

    if (newFiles.isNotEmpty) {
      widget.onImagesSelected(newFiles);
    }

    if (duplicateCount > 0 && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$duplicateCount ảnh đã bị trùng!'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null && mounted) {
      File newFile = File(pickedFile.path);
      widget.onImagesSelected([newFile]); // Send the new file in a list
    }
  }

  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.image, size: 30),
                title: const Text('Chọn ảnh từ thư viện',
                    style: TextStyle(fontSize: 17)),
                onTap: () {
                  Navigator.pop(context);
                  _pickImagesFromGallery();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, size: 30),
                title: const Text('Mở máy ảnh và chụp',
                    style: TextStyle(fontSize: 17)),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromCamera();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showImagePickerOptions(context),
      child: widget.child,
    );
  }
}
