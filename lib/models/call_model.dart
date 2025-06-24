import 'dart:convert';
import 'package:flutter/services.dart';

class CallModel {
  final String name;
  final String time;
  final String avatarAsset;
  final bool isOutgoing;
  final bool isMissed;
  final bool isVideo;

  CallModel({
    required this.name,
    required this.time,
    required this.avatarAsset,
    this.isOutgoing = true,
    this.isMissed = false,
    this.isVideo = false,
  });

  static List<CallModel> sampleCalls = [];

  static Future<void> loadCalls() async {
    if (sampleCalls.isNotEmpty) return;

    try {
      final String jsonString = await rootBundle.loadString(
        'assets/data/calls.json',
      );
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> callsData = jsonData['calls'];

      sampleCalls = callsData
          .map(
            (callData) => CallModel(
              name: callData['name'],
              time: callData['time'],
              avatarAsset: callData['avatarAsset'],
              isOutgoing: callData['isOutgoing'],
              isMissed: callData['isMissed'],
              isVideo: callData['isVideo'],
            ),
          )
          .toList();
    } catch (e) {
      print('Error loading calls: $e');
      // Fallback to sample data if JSON loading fails
      sampleCalls = [
        CallModel(
          name: 'John Doe',
          time: 'Today, 11:45 AM',
          avatarAsset: 'assets/chats_PP/Ellipse 36.png',
          isOutgoing: false,
          isVideo: true,
        ),
        CallModel(
          name: 'Sarah Smith',
          time: 'Today, 10:30 AM',
          avatarAsset: 'assets/chats_PP/Ellipse 37.png',
          isOutgoing: true,
          isMissed: true,
        ),
      ];
    }
  }
}
