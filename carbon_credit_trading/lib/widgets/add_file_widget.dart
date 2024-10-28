import 'dart:io';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/add_video_button.dart';
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
  }

  // Method for picking images
  Future<void> _addImage() async {
    if (_localImageList.length < 5) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.image, size: 30),
                title: const Text('Chọn ảnh từ thư viện',
                    style: TextStyle(fontSize: 17)),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      _localImageList.add(File(image.path));
                      widget.onImageListChanged(_localImageList);
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, size: 30),
                title: const Text('Mở máy ảnh và chụp'),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (image != null) {
                    setState(() {
                      _localImageList.add(File(image.path));
                      widget.onImageListChanged(_localImageList);
                    });
                  }
                },
              ),
            ],
          );
        },
      );
    } else {
      _showErrorDialog('Bạn chỉ có thể thêm tối đa 5 ảnh.');
    }
  }

  void _onVideoChanged(File videoFile) {
    setState(() {
      _localVideo = videoFile;
      widget.onVideoChanged(videoFile);
      _videoController = VideoPlayerController.file(videoFile);
      _videoController?.initialize().then((_) {
        _videoController?.play();
      });
    });
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
                        child: AddVideoButton(
                            onVideoChanged: _onVideoChanged,
                            localVideo: _localVideo,
                            videoController: _videoController,
                            picker: _picker,
                            showErrorDialog: _showErrorDialog,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: AppColors.greenPopUpText),
                                borderRadius: BorderRadius.zero,
                              ),
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 5),
                                  Icon(Icons.video_call_outlined,
                                      color: AppColors.greenButton, size: 35),
                                  SizedBox(height: 5),
                                  Text(
                                    'Thêm video',
                                    style:
                                        TextStyle(color: AppColors.greenButton),
                                  ),
                                  SizedBox(height: 5),
                                ],
                              ),
                            )),
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
                  return AddVideoButton(
                      onVideoChanged: _onVideoChanged,
                      localVideo: _localVideo,
                      videoController: _videoController,
                      picker: _picker,
                      showErrorDialog: _showErrorDialog,
                      child: DottedBorder(
                        color: Colors.grey,
                        strokeWidth: 2,
                        dashPattern: const [5, 5],
                        child: const SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.video_call,
                                  size: 45, color: Colors.grey),
                              SizedBox(height: 5),
                              Text(
                                'Video',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ));
                }
              },
            ),
    );
  }
}
