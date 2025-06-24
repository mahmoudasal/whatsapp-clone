class CallModel {
  final String name;
  final String time;
  final String avatarUrl;
  final bool isOutgoing;
  final bool isMissed;
  final bool isVideo;

  CallModel({
    required this.name,
    required this.time,
    required this.avatarUrl,
    this.isOutgoing = true,
    this.isMissed = false,
    this.isVideo = false,
  });

  // Sample data for demonstration
  static List<CallModel> sampleCalls = [
    CallModel(
      name: 'John Doe',
      time: 'Today, 11:45 AM',
      avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
      isOutgoing: false,
      isVideo: true,
    ),
    CallModel(
      name: 'Sarah Smith',
      time: 'Today, 10:30 AM',
      avatarUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
      isOutgoing: true,
      isMissed: true,
    ),
    CallModel(
      name: 'Mike Johnson',
      time: 'Yesterday, 4:15 PM',
      avatarUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
      isOutgoing: false,
      isMissed: true,
    ),
    CallModel(
      name: 'Emily Wilson',
      time: 'Yesterday, 2:30 PM',
      avatarUrl: 'https://randomuser.me/api/portraits/women/4.jpg',
      isOutgoing: true,
      isVideo: true,
    ),
    CallModel(
      name: 'David Brown',
      time: '06/23/25',
      avatarUrl: 'https://randomuser.me/api/portraits/men/5.jpg',
      isOutgoing: false,
    ),
    CallModel(
      name: 'Jennifer Taylor',
      time: '06/22/25',
      avatarUrl: 'https://randomuser.me/api/portraits/women/6.jpg',
      isOutgoing: true,
    ),
    CallModel(
      name: 'Family Group',
      time: '06/21/25',
      avatarUrl: 'https://randomuser.me/api/portraits/women/7.jpg',
      isOutgoing: true,
      isVideo: true,
    ),
  ];
}
