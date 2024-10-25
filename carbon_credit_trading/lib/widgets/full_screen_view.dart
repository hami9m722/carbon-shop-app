import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'video_player_widget.dart';

// Check image
bool isImageFile(String filePath) {
  return filePath.endsWith('.jpg') ||
      filePath.endsWith('.jpeg') ||
      filePath.endsWith('.png');
}

// Check video
bool isVideoFile(String filePath) {
  return filePath.endsWith('.mp4') ||
      filePath.endsWith('.mov') ||
      filePath.endsWith('.avi') ||
      filePath.endsWith('.mkv');
}

// Function to display fullscreen media (images or videos)
void showFullScreen(BuildContext context, List<dynamic> mediaFiles, int index) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Scaffold(
        backgroundColor: Colors.grey[850],
        body: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.dy > 20) {
              Navigator.pop(context);
            }
          },
          child: PhotoViewGallery.builder(
              itemCount: mediaFiles.length,
              pageController: PageController(initialPage: index),
              builder: (context, index) {
                dynamic mediaFile = mediaFiles[index];
                String? filePath;

                if (mediaFile is File) {
                  filePath = mediaFile.path;
                } else if (mediaFile is String) {
                  filePath = mediaFile;
                }

                return PhotoViewGalleryPageOptions(
                  imageProvider: mediaFile is File
                      ? FileImage(mediaFile)
                      : NetworkImage(mediaFile),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 2,
                  errorBuilder: (context, error, stackTrace) {
                    if (filePath != null && isVideoFile(filePath)) {
                      return VideoPlayerWidget(file: mediaFile);
                    }
                    return const Center(
                      child: Text(
                        'Không hiện thị được',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                );
              }),
        ),
      ),
    ),
  );
}
