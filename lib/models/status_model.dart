class StatusModel {
  final String name;
  final String time;
  final String avatarUrl;
  final bool isViewed;
  final bool isMuted;

  StatusModel({
    required this.name,
    required this.time,
    required this.avatarUrl,
    this.isViewed = false,
    this.isMuted = false,
  });

  // Sample data for demonstration
  static List<StatusModel> sampleStatuses = [
    StatusModel(
      name: 'My Status',
      time: 'Tap to add status update',
      avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
      isViewed: false,
    ),
    StatusModel(
      name: 'John Doe',
      time: '10 minutes ago',
      avatarUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
      isViewed: false,
    ),
    StatusModel(
      name: 'Sarah Smith',
      time: '25 minutes ago',
      avatarUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
      isViewed: true,
    ),
    StatusModel(
      name: 'Emily Wilson',
      time: 'Today, 11:45 AM',
      avatarUrl: 'https://randomuser.me/api/portraits/women/4.jpg',
      isViewed: false,
      isMuted: true,
    ),
    StatusModel(
      name: 'Mike Johnson',
      time: 'Today, 10:30 AM',
      avatarUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
      isViewed: true,
    ),
    StatusModel(
      name: 'David Brown',
      time: 'Today, 9:15 AM',
      avatarUrl: 'https://randomuser.me/api/portraits/men/5.jpg',
      isViewed: true,
    ),
    StatusModel(
      name: 'Jennifer Taylor',
      time: 'Yesterday, 8:45 PM',
      avatarUrl: 'https://randomuser.me/api/portraits/women/6.jpg',
      isViewed: true,
      isMuted: true,
    ),
  ];
}
