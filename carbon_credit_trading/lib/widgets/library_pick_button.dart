import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LibraryPickButton extends StatelessWidget {
  final Function(List<XFile>) onPickMedia;

  const LibraryPickButton({super.key, required this.onPickMedia});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.photo),
      onPressed: () async {
        final ImagePicker picker = ImagePicker();

        final pickedOption = await showDialog<MediaType>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Chọn loại tệp'),
              content: const Text('Bạn muốn chọn hình ảnh hay video?'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Hình ảnh'),
                  onPressed: () {
                    Navigator.of(context).pop(MediaType.image);
                  },
                ),
                TextButton(
                  child: const Text('Video'),
                  onPressed: () {
                    Navigator.of(context).pop(MediaType.video);
                  },
                ),
              ],
            );
          },
        );

        if (pickedOption == null) return;

        List<XFile> selectedFiles = [];

        // Choose file from library
        if (pickedOption == MediaType.image) {
          final List<XFile> selectedImages = await picker.pickMultiImage();
          selectedFiles.addAll(selectedImages);
        } else if (pickedOption == MediaType.video) {
          bool moreVideos = true;
          while (moreVideos) {
            final XFile? selectedVideo =
                await picker.pickVideo(source: ImageSource.gallery);
            if (selectedVideo != null) {
              selectedFiles.add(selectedVideo);
            } else {
              moreVideos = false;
            }
          }
        }

        if (selectedFiles.isNotEmpty) {
          onPickMedia(selectedFiles);
        }
      },
    );
  }
}

enum MediaType { image, video }
