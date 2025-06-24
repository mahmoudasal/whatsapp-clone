import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChatsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[50],
      elevation: 0,
      leadingWidth: 80,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Center(
          child: GestureDetector(
            onTap: () {
              // Handle edit button tap
            },
            child: const Text(
              'Edit',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
      centerTitle: true,
      title: const Text(
        'Chats',
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(CupertinoIcons.camera, color: Colors.blue, size: 24),
          onPressed: () {
            // Handle camera button tap
          },
        ),
        IconButton(
          icon: const Icon(
            CupertinoIcons.square_pencil,
            color: Colors.blue,
            size: 24,
          ),
          onPressed: () {
            // Handle new message button tap
          },
        ),
        const SizedBox(width: 4),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: const Color(0xFFE0E0E0)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
