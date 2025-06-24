class MessageModel {
  final String id;
  final String senderId;
  final String content;
  final DateTime timestamp;
  final bool isRead;
  final bool isSent;
  final bool isDelivered;
  final MessageType type;
  final String? mediaUrl;
  final Duration? audioDuration;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.content,
    required this.timestamp,
    this.isRead = false,
    this.isSent = true,
    this.isDelivered = true,
    this.type = MessageType.text,
    this.mediaUrl,
    this.audioDuration,
  });

  bool get isFromMe => senderId == 'me';

  String get timeString {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final messageDate = DateTime(
      timestamp.year,
      timestamp.month,
      timestamp.day,
    );

    if (messageDate == today) {
      return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
    } else if (messageDate == yesterday) {
      return 'Yesterday';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
  }

  // Sample data for demonstration
  static List<MessageModel> getSampleMessages() {
    return [
      MessageModel(
        id: '1',
        senderId: 'contact',
        content: 'Hi there! How are you doing?',
        timestamp: DateTime.now().subtract(
          const Duration(days: 0, hours: 2, minutes: 15),
        ),
        isRead: true,
        isDelivered: true,
      ),
      MessageModel(
        id: '2',
        senderId: 'me',
        content: 'Hey! I\'m good, thanks for asking. How about you?',
        timestamp: DateTime.now().subtract(
          const Duration(days: 0, hours: 2, minutes: 10),
        ),
        isRead: true,
        isDelivered: true,
      ),
      MessageModel(
        id: '3',
        senderId: 'contact',
        content: 'I\'m doing well. Just finished a big project at work.',
        timestamp: DateTime.now().subtract(
          const Duration(days: 0, hours: 2, minutes: 5),
        ),
        isRead: true,
        isDelivered: true,
      ),
      MessageModel(
        id: '4',
        senderId: 'me',
        content:
            'That\'s great! Congratulations on completing it. Was it the one you mentioned last week?',
        timestamp: DateTime.now().subtract(
          const Duration(days: 0, hours: 1, minutes: 55),
        ),
        isRead: true,
        isDelivered: true,
      ),
      MessageModel(
        id: '5',
        senderId: 'contact',
        content:
            'Yes, exactly! It was quite challenging but very rewarding. I learned a lot from it.',
        timestamp: DateTime.now().subtract(
          const Duration(days: 0, hours: 1, minutes: 50),
        ),
        isRead: true,
        isDelivered: true,
      ),
      MessageModel(
        id: '6',
        senderId: 'me',
        content:
            'Learning new things is always the best part. Are you planning to take some time off now?',
        timestamp: DateTime.now().subtract(
          const Duration(days: 0, hours: 1, minutes: 45),
        ),
        isRead: true,
        isDelivered: true,
      ),
      MessageModel(
        id: '7',
        senderId: 'contact',
        content:
            'Actually, I was thinking about that. I might take a short vacation next month.',
        timestamp: DateTime.now().subtract(
          const Duration(days: 0, hours: 1, minutes: 40),
        ),
        isRead: true,
        isDelivered: true,
      ),
      MessageModel(
        id: '8',
        senderId: 'me',
        content: 'That sounds like a great idea! Any destination in mind?',
        timestamp: DateTime.now().subtract(
          const Duration(days: 0, hours: 0, minutes: 30),
        ),
        isRead: true,
        isDelivered: true,
      ),
      MessageModel(
        id: '9',
        senderId: 'contact',
        content:
            'I\'m thinking about going to the mountains for some hiking and relaxation.',
        timestamp: DateTime.now().subtract(
          const Duration(days: 0, hours: 0, minutes: 25),
        ),
        isRead: true,
        isDelivered: true,
      ),
      MessageModel(
        id: '10',
        senderId: 'me',
        content:
            'Perfect choice! Nature is the best way to recharge. Let me know when you\'ve finalized your plans.',
        timestamp: DateTime.now().subtract(
          const Duration(days: 0, hours: 0, minutes: 20),
        ),
        isRead: false,
        isDelivered: true,
      ),
    ];
  }
}

enum MessageType { text, image, video, audio, file, location }
