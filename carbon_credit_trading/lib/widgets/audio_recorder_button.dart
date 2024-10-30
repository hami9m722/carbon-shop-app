import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

class AudioRecorderButton extends StatefulWidget {
  final Function(String audioPath) onAudioRecorded;

  const AudioRecorderButton({super.key, required this.onAudioRecorded});

  @override
  createState() => _AudioRecorderButtonState();
}

class _AudioRecorderButtonState extends State<AudioRecorderButton> {
  final AudioRecorder _record = AudioRecorder();
  bool _isRecording = false;
  String? _audioFilePath;

  Future<void> _startRecording() async {
    if (await _record.hasPermission()) {
      final directory = await getTemporaryDirectory();
      _audioFilePath =
          '${directory.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';

      if (_audioFilePath != null) {
        await _record.start(
          const RecordConfig(),
          path: _audioFilePath!,
        );
        setState(() {
          _isRecording = true;
        });
      }
    }
  }

  Future<void> _stopRecording() async {
    await _record.stop();
    setState(() {
      _isRecording = false;
    });

    if (_audioFilePath != null) {
      widget.onAudioRecorded(_audioFilePath!);
    }
  }

  void _toggleRecording() {
    if (_isRecording) {
      _stopRecording();
    } else {
      _startRecording();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleRecording,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _isRecording ? Icons.stop : Icons.mic,
              size: 30,
              color: _isRecording ? Colors.red : Colors.black,
            ),
            const SizedBox(height: 5), // Khoảng cách giữa icon và text
            Text(
              'Ghi âm',
              style: TextStyle(
                color: _isRecording ? Colors.red : Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
