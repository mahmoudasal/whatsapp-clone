class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final bool isRead;
  final int unreadCount;

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
    this.isRead = true,
    this.unreadCount = 0,
  });

  // Sample data for demonstration
  static List<ChatModel> sampleChats = [
    ChatModel(
      name: 'John Doe',
      message: 'Hey, how are you doing?',
      time: '11:45 AM',
      avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
      isRead: true,
    ),
    ChatModel(
      name: 'Sarah Smith',
      message: 'Can we meet tomorrow?',
      time: '10:30 AM',
      avatarUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
      isRead: false,
      unreadCount: 3,
    ),
    ChatModel(
      name: 'Mike Johnson',
      message: 'I sent you the files',
      time: 'Yesterday',
      avatarUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
      isRead: true,
    ),
    ChatModel(
      name: 'Emily Wilson',
      message: 'Thanks for your help!',
      time: 'Yesterday',
      avatarUrl: 'https://randomuser.me/api/portraits/women/4.jpg',
      isRead: false,
      unreadCount: 1,
    ),
    ChatModel(
      name: 'David Brown',
      message: 'Let me know when you arrive',
      time: '06/22/25',
      avatarUrl: 'https://randomuser.me/api/portraits/men/5.jpg',
      isRead: true,
    ),
    ChatModel(
      name: 'Jennifer Taylor',
      message: 'The meeting is confirmed',
      time: '06/21/25',
      avatarUrl: 'https://randomuser.me/api/portraits/women/6.jpg',
      isRead: true,
    ),
    ChatModel(
      name: 'Family Group',
      message: 'Mom: We need to plan for the weekend',
      time: '06/20/25',
      avatarUrl: 'https://randomuser.me/api/portraits/women/7.jpg',
      isRead: true,
    ),
    ChatModel(
      name: 'Work Team',
      message: 'Alex: Don\'t forget the deadline!',
      time: '06/19/25',
      avatarUrl: 'https://randomuser.me/api/portraits/men/8.jpg',
      isRead: false,
      unreadCount: 5,
    ),
  ];
}
