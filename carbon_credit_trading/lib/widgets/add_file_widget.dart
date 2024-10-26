import 'dart:io';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/full_screen_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class AddFileWidget extends StatefulWidget {
  final List<File> imageList;
  final File? video;
  final ValueChanged<List<File>> onImageListChanged;
  final ValueChanged<File?> onVideoChanged;

  const AddFileWidget({
    super.key,
    required this.imageList,
    required this.video,
    required this.onImageListChanged,
    required this.onVideoChanged,
  });

  @override
  createState() => _AddFileWidgetState();
}

class _AddFileWidgetState extends State<AddFileWidget> {
  final ImagePicker _picker = ImagePicker();
  VideoPlayerController? _videoController;

  // Local state variables for images and video
  List<File> _localImageList = [];
  File? _localVideo;

  @override
  void initState() {
    super.initState();
    _localImageList = List.from(widget.imageList);
    _localVideo = widget.video;
  }

  // Method for picking images
  Future<void> _addImage() async {
    if (_localImageList.length < 5) {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _localImageList.add(File(image.path));
          widget.onImageListChanged(_localImageList);
        });
      }
    } else {
      _showErrorDialog('You can only add up to 5 images.');
    }
  }

  // Method for picking video
  Future<void> _addVideo() async {
    if (_localVideo == null) {
      try {
        final XFile? video =
            await _picker.pickVideo(source: ImageSource.gallery);
        if (video != null) {
          final File videoFile = File(video.path);
          final VideoPlayerController controller =
              VideoPlayerController.file(videoFile);
          await controller.initialize();

          final Duration videoDuration = controller.value.duration;
          if (videoDuration.inSeconds < 3) {
            _showErrorDialog('Video must be longer than 3 seconds.');
            controller.dispose();
            return;
          } else if (videoDuration.inSeconds >= 60) {
            _showErrorDialog('Video must be less than 60 seconds.');
            controller.dispose();
            return;
          }

          final int fileSize = await videoFile.length();
          if (fileSize < 30 * 1024 * 1024) {
            setState(() {
              _localVideo = videoFile;
              _videoController = controller;
              widget.onVideoChanged(_localVideo);
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

  // Remove an image
  void _removeImage(int index) {
    setState(() {
      _localImageList.removeAt(index);
      widget.onImageListChanged(_localImageList);
    });
  }

  // Remove a video
  void _removeVideo() {
    setState(() {
      _videoController?.dispose();
      _localVideo = null;
      widget.onVideoChanged(null);
    });
  }

  // Show an error dialog
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

  // Full screen view for media (implement as needed)
  void _showFileFullScreen(int index) {
    List<dynamic> fileList = [
      ..._localImageList,
      if (_localVideo != null) _localVideo
    ];
    showFullScreen(context, fileList, index);
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _localImageList.isEmpty && _localVideo == null
          ? Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _addImage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppColors.greenButton,
                            side: const BorderSide(
                                color: AppColors.greenPopUpText),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 5),
                              Icon(Icons.camera_alt,
                                  color: AppColors.greenButton, size: 35),
                              SizedBox(height: 5),
                              Text('Thêm hình ảnh'),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _addVideo,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppColors.greenButton,
                            side: const BorderSide(
                                color: AppColors.greenPopUpText),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 5),
                              Icon(Icons.video_call_outlined,
                                  color: AppColors.greenButton, size: 35),
                              SizedBox(height: 5),
                              Text('Thêm Video'),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: _localImageList.length +
                  (_localVideo != null ? 1 : 0) +
                  (_localImageList.length < 5 ? 1 : 0) +
                  (_localVideo == null ? 1 : 0),
              itemBuilder: (context, index) {
                // Display images
                if (index < _localImageList.length) {
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      GestureDetector(
                        onTap: () => _showFileFullScreen(index),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(_localImageList[index]),
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
                          onPressed: () => _removeImage(index),
                        ),
                      ),
                    ],
                  );
                }
                // Display video
                else if (index == _localImageList.length &&
                    _localVideo != null) {
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            _showFileFullScreen(_localImageList.length),
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: VideoPlayer(_videoController!),
                        ),
                      ),
                      Positioned(
                        top: -10,
                        right: -10,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.cancel, color: Colors.red),
                          onPressed: _removeVideo,
                        ),
                      ),
                    ],
                  );
                }
                // Add image button
                else if (index ==
                        _localImageList.length +
                            (_localVideo != null ? 1 : 0) &&
                    _localImageList.length < 5) {
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
                          foregroundColor: Colors.grey,
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.camera_alt, size: 35),
                            const SizedBox(height: 5),
                            Text(
                              '${5 - _localImageList.length}/5',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                // Add video button
                else {
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
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.video_call, size: 45),
                            SizedBox(height: 5),
                            Text('Video'),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
    );
  }
}
