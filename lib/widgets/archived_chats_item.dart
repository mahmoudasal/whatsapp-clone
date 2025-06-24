import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ArchivedChatsItem extends StatelessWidget {
  final int count;

  const ArchivedChatsItem({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: const Icon(
            CupertinoIcons.archivebox,
            color: Colors.grey,
            size: 24,
          ),
        ),
        title: const Text(
          'Archived Chats',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              count.toString(),
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(width: 4),
            const Icon(
              CupertinoIcons.chevron_right,
              color: Colors.grey,
              size: 16,
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
