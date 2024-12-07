import 'dart:io';
import 'package:carbon_credit_trading/widgets/full_screen__view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class AddImageScreen extends StatefulWidget {
  const AddImageScreen({super.key});

  @override
  createState() => _AddImageScreenState();
}

class _AddImageScreenState extends State<AddImageScreen> {
  final ImagePicker _picker = ImagePicker();
  final List<File> _images = [];
  File? _video;
  VideoPlayerController? _videoController;

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

  Future<void> _addVideo() async {
    if (_video == null) {
      try {
        final XFile? video =
            await _picker.pickVideo(source: ImageSource.gallery);
        if (video != null) {
          final File videoFile = File(video.path);

          // Khởi tạo VideoPlayerController
          final VideoPlayerController controller =
              VideoPlayerController.file(videoFile);
          await controller.initialize();

          final Duration videoDuration = controller.value.duration;
          if (videoDuration.inSeconds < 3) {
            _showErrorDialog('Video must be shorter than 3 seconds.');
            controller.dispose();
            return;
          } else if (videoDuration.inSeconds >= 60) {
            _showErrorDialog('Video must be less than 60 seconds.');
            controller.dispose();
            return;
          }

          // Lấy kích thước file video
          final int fileSize = await videoFile.length();
          if (fileSize < 30 * 1024 * 1024) {
            setState(() {
              _video = videoFile;
              _videoController = controller;
            });
          } else {
            _showErrorDialog('Video size must be less than 30 MB.');
            controller.dispose();
          }
        }
      } catch (e) {
        _showErrorDialog('An error occurred while adding the video: $e');
      }
    }
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  void _removeVideo() {
    setState(() {
      _videoController?.dispose();
      _video = null;
      _videoController = null;
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showFullScreenMedia(int index) {
    List<dynamic> mediaList = [..._images, if (_video != null) _video];
    showFullScreen(context, mediaList, index);
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thêm Hình ảnh và Video')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: _images.length +
              (_video != null ? 1 : 0) +
              (_images.length < 5 ? 1 : 0) +
              (_video == null ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < _images.length) {
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  GestureDetector(
                    onTap: () => showFullScreen(context, _images, index),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: FileImage(_images[index]),
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
                        onPressed: () => _removeImage(index)),
                  ),
                ],
              );
            } else if (index == _images.length && _video != null) {
              return GestureDetector(
                onTap: () => _showFullScreenMedia(_images.length),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: VideoPlayer(_videoController!),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.red),
                        onPressed: _removeVideo,
                      ),
                    ),
                  ],
                ),
              );
            } else if (index == _images.length + (_video != null ? 1 : 0) &&
                _images.length < 5) {
              return DottedBorder(
                color: Colors.grey,
                strokeWidth: 2,
                dashPattern: const [5, 5],
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: ElevatedButton(
                    onPressed: _addImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.grey[50],
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.camera_alt,
                            color: Colors.grey, size: 35),
                        const SizedBox(height: 5),
                        Text(
                          '${5 - _images.length}/5',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (index ==
                    _images.length +
                        (_video != null ? 1 : 0) +
                        (_images.length < 5 ? 1 : 0) &&
                _video == null) {
              return DottedBorder(
                  color: Colors.grey,
                  strokeWidth: 2,
                  dashPattern: const [5, 5],
                  child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: ElevatedButton(
                        onPressed: _addVideo,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.grey,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment:
                              MainAxisAlignment.center, // Center the content
                          children: [
                            Icon(Icons.videocam, color: Colors.grey, size: 45),
                            SizedBox(height: 5),
                            Text('Video'),
                          ],
                        ),
                      )));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
