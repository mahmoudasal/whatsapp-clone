import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'widgets/search_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: false,
              title: const Text(
                'Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.grey[50],
              elevation: 0,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: SearchBarWidget(hintText: 'Search'),
              ),
            ),
            SliverToBoxAdapter(child: _buildProfileSection(context)),
            SliverList(
              delegate: SliverChildListDelegate([
                _buildSettingItem(
                  icon: CupertinoIcons.star,
                  iconColor: Colors.yellow[700]!,
                  title: 'Starred Messages',
                  onTap: () {},
                ),
                _buildSettingItem(
                  icon: CupertinoIcons.device_laptop,
                  iconColor: Colors.green,
                  title: 'Linked Devices',
                  onTap: () {},
                ),
                const Divider(
                  height: 20,
                  thickness: 8,
                  color: Color(0xFFF0F0F0),
                ),
                _buildSettingItem(
                  icon: CupertinoIcons.bell,
                  iconColor: Colors.red,
                  title: 'Notifications',
                  onTap: () {},
                ),
                _buildSettingItem(
                  icon: CupertinoIcons.lock,
                  iconColor: Colors.green,
                  title: 'Privacy',
                  onTap: () {},
                ),
                _buildSettingItem(
                  icon: CupertinoIcons.chat_bubble_2,
                  iconColor: Colors.green,
                  title: 'Chats',
                  onTap: () {},
                ),
                _buildSettingItem(
                  icon: CupertinoIcons.arrow_right_arrow_left,
                  iconColor: Colors.green,
                  title: 'Data and Storage Usage',
                  onTap: () {},
                ),
                const Divider(
                  height: 20,
                  thickness: 8,
                  color: Color(0xFFF0F0F0),
                ),
                _buildSettingItem(
                  icon: CupertinoIcons.info,
                  iconColor: Colors.green,
                  title: 'Help',
                  onTap: () {},
                ),
                _buildSettingItem(
                  icon: CupertinoIcons.heart,
                  iconColor: Colors.red,
                  title: 'Tell a Friend',
                  onTap: () {},
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://randomuser.me/api/portraits/men/31.jpg',
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'John Appleseed',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Available',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Icon(CupertinoIcons.qrcode, color: Colors.green[600], size: 28),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
    String? subtitle,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: iconColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: iconColor, size: 22),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            )
          : null,
      trailing: const Icon(
        CupertinoIcons.right_chevron,
        color: Colors.grey,
        size: 16,
      ),
      onTap: onTap,
    );
  }
}
