import 'dart:convert';
import 'package:flutter/services.dart';

class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarAsset;
  final bool isRead;
  final int unreadCount;

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.avatarAsset,
    this.isRead = true,
    this.unreadCount = 0,
  });

  static List<ChatModel> sampleChats = [];

  // static Future<void> loadChats() async {
  //   if (sampleChats.isNotEmpty) return;

  //   try {
  //     final String jsonString = await rootBundle.loadString(
  //       'assets/data/chats.json',
  //     );
  //     final Map<String, dynamic> jsonData = json.decode(jsonString);
  //     final List<dynamic> chatsData = jsonData['chats'];

  //     sampleChats = chatsData
  //         .map(
  //           (chatData) => ChatModel(
  //             name: chatData['name'],
  //             message: chatData['message'],
  //             time: chatData['time'],
  //             avatarAsset: chatData['avatarAsset'],
  //             isRead: chatData['isRead'],
  //             unreadCount: chatData['unreadCount'],
  //           ),
  //         )
  //         .toList();
  //   } catch (e) {
  //     print('Error loading chats: $e');
  //     // Fallback to sample data if JSON loading fails
  //     sampleChats = [
  //       ChatModel(
  //         name: 'John Doe',
  //         message: 'Hey, how are you doing?',
  //         time: '11:45 AM',
  //         avatarAsset: 'assets/chats_PP/Ellipse 36.png',
  //         isRead: true,
  //       ),
  //       ChatModel(
  //         name: 'Sarah Smith',
  //         message: 'Can we meet tomorrow?',
  //         time: '10:30 AM',
  //         avatarAsset: 'assets/chats_PP/Ellipse 37.png',
  //         isRead: false,
  //         unreadCount: 3,
  //       ),
  //     ];
  //   }
  // }
}
