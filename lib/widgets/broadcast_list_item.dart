import 'package:flutter/material.dart';

class BroadcastListItem extends StatelessWidget {
  const BroadcastListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.broadcast_on_personal,
          color: Colors.grey,
          size: 24,
        ),
      ),
      title: const Text(
        'New Broadcast List',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }
}
