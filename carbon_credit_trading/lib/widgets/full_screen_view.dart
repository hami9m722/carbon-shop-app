import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:share_plus/share_plus.dart';
import 'video_player_widget.dart';
import 'package:http/http.dart' as http;

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
          child: Stack(
            children: [
              PhotoViewGallery.builder(
                itemCount: mediaFiles.length,
                pageController: PageController(initialPage: index),
                onPageChanged: (newIndex) {
                  index = newIndex;
                },
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
                },
              ),
              Positioned(
                top: 40,
                right: 20,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.download, color: Colors.white),
                      onPressed: () async {
                        // Tải xuống tệp
                        await downloadPath(context, mediaFiles[index]);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.share, color: Colors.white),
                      onPressed: () {
                        dynamic mediaPath = mediaFiles[index];

                        try {
                          Share.share(mediaPath);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Không thể chia sẻ tệp này: $e')),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Future<void> downloadPath(BuildContext context, String mediaUrl) async {
  try {
    String directoryPath;
    bool dirDownloadExists = true;

    if (Platform.isIOS) {
      final iosDirectory = await getDownloadsDirectory();
      if (iosDirectory != null) {
        directoryPath = iosDirectory.path;
      } else {
        throw Exception('Không thể lấy thư mục tải xuống trên iOS.');
      }
    } else {
      // Check download dir in Android
      directoryPath = "/storage/emulated/0/Download/";
      dirDownloadExists = await Directory(directoryPath).exists();

      if (!dirDownloadExists) {
        directoryPath = "/storage/emulated/0/Downloads/";
        dirDownloadExists = await Directory(directoryPath).exists();

        if (!dirDownloadExists) {
          throw Exception('Thư mục tải xuống không khả dụng trên thiết bị.');
        }
      }
    }

    // Get name folder from URL
    final fileName = mediaUrl.split('/').last;
    final filePath = "$directoryPath/$fileName";

    // Gửi yêu cầu tải xuống tệp
    final response = await http.get(Uri.parse(mediaUrl));
    if (response.statusCode == 200) {
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Tải xuống thành công: $fileName'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Không thể tải xuống tệp: ${response.statusCode}'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi khi tải xuống tệp: $e'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
