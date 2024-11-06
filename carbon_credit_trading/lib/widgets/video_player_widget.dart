import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final dynamic file; // Can be File or String
  const VideoPlayerWidget({super.key, required this.file});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Check if the input is a File or a String and initialize the controller accordingly
    if (widget.file is File) {
      _controller = VideoPlayerController.file(widget.file);
    } else if (widget.file is String) {
      _controller =
          VideoPlayerController.networkUrl(widget.file); 
    } else {
      throw Exception('Invalid video source type');
    }

    _initializeVideoPlayerFuture = _controller.initialize();

    // Set the video to loop if needed
    _controller.setLooping(false);

    // Listener to pause the video when it finishes playing
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        _controller.pause();
        setState(() {});
      }
    });

    // Play video when it is initialized
    _initializeVideoPlayerFuture.then((_) {
      _controller.play();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              color: Colors.black,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                      });
                    },
                  ),
                  // Play/Pause button
                  Positioned(
                    child: AnimatedOpacity(
                      opacity: _controller.value.isPlaying ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(20.0),
                          child: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Show play button when video finishes
                  if (!_controller.value.isPlaying &&
                      _controller.value.position == _controller.value.duration)
                    Positioned(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _controller.seekTo(
                                Duration.zero); // Reset to the beginning
                            _controller.play(); // Play again
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(20.0),
                          child: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
