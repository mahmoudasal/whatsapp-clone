import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'models/chat_model.dart';
import 'navigation/app_routes.dart';

class ChatWidget extends StatelessWidget {
  final ChatModel chat;

  const ChatWidget({super.key, required this.chat});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        leading: CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(chat.avatarAsset),
          // Add a pinned image effect if the chat is pinned
          foregroundColor: Colors.transparent,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                chat.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              chat.time,
              style: TextStyle(
                fontSize: 12,
                color: chat.isRead ? Colors.grey : Colors.green,
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            children: [
              if (chat.isRead)
                const Icon(
                  CupertinoIcons.checkmark_alt,
                  size: 12,
                  color: Colors.grey,
                ),
              if (chat.isRead) const SizedBox(width: 4),
              Expanded(
                child: Text(
                  chat.message,
                  style: TextStyle(
                    color: chat.isRead ? Colors.grey : Colors.black87,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (!chat.isRead && chat.unreadCount > 0)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Text(
                    chat.unreadCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
        onTap: () {
          NavigationService.navigateTo(AppRoutes.chatDetail, arguments: chat);
        },
      ),
    );
  }
}
