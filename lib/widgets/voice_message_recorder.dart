import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class VoiceMessageRecorder extends StatefulWidget {
  final Function(Duration) onRecordingComplete;

  const VoiceMessageRecorder({super.key, required this.onRecordingComplete});

  @override
  State<VoiceMessageRecorder> createState() => _VoiceMessageRecorderState();
}

class _VoiceMessageRecorderState extends State<VoiceMessageRecorder> {
  bool _isRecording = false;
  bool _isLocked = false;
  Duration _recordingDuration = Duration.zero;
  Timer? _timer;
  double _lockThreshold = 100.0;
  double _dragOffset = 0.0;

  void _startRecording() {
    setState(() {
      _isRecording = true;
      _recordingDuration = Duration.zero;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _recordingDuration = Duration(
          seconds: _recordingDuration.inSeconds + 1,
        );
      });
    });

    // Here you'd initialize actual audio recording
    // Using a plugin like record or flutter_sound
  }

  void _stopRecording() {
    _timer?.cancel();
    final duration = _recordingDuration;
    setState(() {
      _isRecording = false;
      _isLocked = false;
      _recordingDuration = Duration.zero;
    });

    // Here you'd stop actual audio recording and save the file
    widget.onRecordingComplete(duration);
  }

  void _lockRecording() {
    setState(() {
      _isLocked = true;
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isRecording) {
      return GestureDetector(
        onLongPress: _startRecording,
        child: const Icon(CupertinoIcons.mic, color: Colors.blue, size: 24),
      );
    }

    return Container(
      width: double.infinity,
      height: 50,
      color: Colors.grey[100],
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (!_isLocked) {
            setState(() {
              _dragOffset = details.localPosition.dy;
            });
            if (_dragOffset < -_lockThreshold) {
              _lockRecording();
            }
          }
        },
        onLongPressEnd: (_) {
          if (!_isLocked) {
            _stopRecording();
          }
        },
        child: Row(
          children: [
            const SizedBox(width: 16),
            if (_isLocked)
              IconButton(
                icon: const Icon(CupertinoIcons.stop_fill, color: Colors.red),
                onPressed: _stopRecording,
              )
            else
              Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(CupertinoIcons.mic_fill, color: Colors.red),
                  if (_dragOffset < 0)
                    Positioned(
                      top: 0,
                      child: Icon(
                        CupertinoIcons.lock,
                        color: _dragOffset < -(_lockThreshold / 2)
                            ? Colors.blue
                            : Colors.grey,
                        size: 16,
                      ),
                    ),
                ],
              ),
            const SizedBox(width: 12),
            Text(
              _isLocked ? 'Tap to stop' : 'Slide up to lock',
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
            ),
            const Spacer(),
            Text(
              _formatDuration(_recordingDuration),
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
