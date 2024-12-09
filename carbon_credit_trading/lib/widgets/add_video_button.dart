import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class AddVideoButton extends StatelessWidget {
  final Function(File) onVideoChanged;
  final File? localVideo;
  final VideoPlayerController? videoController;
  final ImagePicker picker;
  final Function(String) showErrorDialog;
  final Widget child;

  const AddVideoButton({
    super.key,
    this.localVideo,
    this.videoController,
    required this.picker,
    required this.showErrorDialog,
    required this.child,
    required this.onVideoChanged,
  });

  Future<void> _pickVideo(BuildContext context) async {
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
                title: const Text('Chọn video từ thư viện',
                    style: TextStyle(fontSize: 17)),
                onTap: () {
                  Navigator.pop(context);
                  _selectVideoFromGallery();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, size: 30),
                title: const Text('Quay video', style: TextStyle(fontSize: 17)),
                onTap: () {
                  Navigator.pop(context);
                  _recordVideo();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _selectVideoFromGallery() async {
    if (localVideo == null) {
      try {
        final XFile? video =
            await picker.pickVideo(source: ImageSource.gallery);
        if (video != null) {
          await _validateAndProcessVideo(video);
        }
      } catch (e) {
        showErrorDialog('An error occurred while adding the video: $e');
      }
    }
  }

  Future<void> _recordVideo() async {
    if (localVideo == null) {
      try {
        final XFile? video = await picker.pickVideo(source: ImageSource.camera);
        if (video != null) {
          await _validateAndProcessVideo(video);
        }
      } catch (e) {
        showErrorDialog('An error occurred while recording the video: $e');
      }
    }
  }

  Future<void> _validateAndProcessVideo(XFile video) async {
    final File videoFile = File(video.path);
    final VideoPlayerController controller =
        VideoPlayerController.file(videoFile);
    await controller.initialize();

    final Duration videoDuration = controller.value.duration;
    if (videoDuration.inSeconds < 3) {
      showErrorDialog('Video must be longer than 3 seconds.');
      controller.dispose();
      return;
    } else if (videoDuration.inSeconds >= 60) {
      showErrorDialog('Video must be less than 60 seconds.');
      controller.dispose();
      return;
    }

    final int fileSize = await videoFile.length();
    if (fileSize < 30 * 1024 * 1024) {
      onVideoChanged(videoFile);
    } else {
      showErrorDialog('Video size must be less than 30 MB.');
      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickVideo(context),
      child: child,
    );
  }
}
