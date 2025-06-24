import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/message_model.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isFromMe
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          left: message.isFromMe ? 80 : 8,
          right: message.isFromMe ? 8 : 80,
          top: 4,
          bottom: 4,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: message.isFromMe
              ? const Color(0xFFDCF8C6) // Light green for sent messages
              : Colors.white, // White for received messages
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message.content,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message.timeString,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                if (message.isFromMe) ...[
                  const SizedBox(width: 4),
                  Icon(
                    message.isRead
                        ? CupertinoIcons.check_mark_circled_solid
                        : CupertinoIcons.check_mark,
                    size: 12,
                    color: message.isRead ? Colors.blue : Colors.grey[600],
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DateDivider extends StatelessWidget {
  final String date;

  const DateDivider({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const Expanded(child: Divider(color: Colors.grey, thickness: 0.5)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              date,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Expanded(child: Divider(color: Colors.grey, thickness: 0.5)),
        ],
      ),
    );
  }
}
