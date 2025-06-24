import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'models/chat_model.dart';

class ContactInfoScreen extends StatelessWidget {
  final ChatModel contact;

  const ContactInfoScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        title: const Text(
          'Contact Info',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile section
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(contact.avatarAsset),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      contact.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '+1 555-123-4567',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),

            // Action buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    icon: CupertinoIcons.chat_bubble_fill,
                    label: 'Message',
                    onTap: () => Navigator.pop(context),
                  ),
                  _buildActionButton(
                    icon: CupertinoIcons.phone_fill,
                    label: 'Audio',
                    onTap: () {},
                  ),
                  _buildActionButton(
                    icon: CupertinoIcons.video_camera_solid,
                    label: 'Video',
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const Divider(thickness: 8),

            // Info list
            ListTile(
              leading: const Icon(CupertinoIcons.info, color: Colors.grey),
              title: const Text('Status'),
              subtitle: Text(contact.message),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(CupertinoIcons.bell, color: Colors.grey),
              title: const Text('Mute notifications'),
              trailing: Switch(
                value: false,
                onChanged: (value) {},
                activeColor: Colors.green,
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(CupertinoIcons.photo, color: Colors.grey),
              title: const Text('Media, links, and docs'),
              trailing: const Icon(
                CupertinoIcons.chevron_right,
                color: Colors.grey,
              ),
              onTap: () {},
            ),

            const Divider(thickness: 8),

            ListTile(
              leading: const Icon(CupertinoIcons.delete, color: Colors.red),
              title: const Text(
                'Block Contact',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
