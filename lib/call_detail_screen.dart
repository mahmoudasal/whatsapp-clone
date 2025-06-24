import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'models/call_model.dart';

class CallDetailScreen extends StatefulWidget {
  final CallModel call;

  const CallDetailScreen({super.key, required this.call});

  @override
  State<CallDetailScreen> createState() => _CallDetailScreenState();
}

class _CallDetailScreenState extends State<CallDetailScreen> {
  bool _isMuted = false;
  bool _isSpeakerOn = false;
  bool _isVideoOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Call background (would be video or avatar)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(widget.call.avatarUrl),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.call.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.call.isVideo ? 'Video call' : 'Voice call',
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  'Calling...',
                  style: TextStyle(color: Colors.grey[400], fontSize: 14),
                ),
              ],
            ),
          ),

          // Call controls
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        _isMuted
                            ? CupertinoIcons.mic_slash
                            : CupertinoIcons.mic,
                        color: _isMuted ? Colors.red : Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          _isMuted = !_isMuted;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        _isSpeakerOn
                            ? CupertinoIcons.speaker_2
                            : CupertinoIcons.speaker_1,
                        color: _isSpeakerOn ? Colors.blue : Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          _isSpeakerOn = !_isSpeakerOn;
                        });
                      },
                    ),
                    if (widget.call.isVideo)
                      IconButton(
                        icon: Icon(
                          _isVideoOn
                              ? CupertinoIcons.video_camera
                              : CupertinoIcons.video_camera_solid,
                          color: _isVideoOn ? Colors.blue : Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            _isVideoOn = !_isVideoOn;
                          });
                        },
                      ),
                  ],
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: const Icon(
                      CupertinoIcons.phone_down,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Back button
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
