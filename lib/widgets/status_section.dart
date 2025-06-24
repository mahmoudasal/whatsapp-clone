import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StatusSection extends StatelessWidget {
  const StatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.grey[100],
      child: Row(
        children: [
          const Icon(
            CupertinoIcons.exclamationmark_circle,
            color: Colors.green,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 14, color: Colors.grey),
                children: [
                  TextSpan(
                    text: 'Your chats are end-to-end encrypted. ',
                    style: TextStyle(color: Colors.black87),
                  ),
                  TextSpan(
                    text: 'Learn more',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
