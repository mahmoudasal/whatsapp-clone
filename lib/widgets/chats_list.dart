import 'package:flutter/material.dart';
import '../chat_widget.dart';
import '../models/chat_model.dart';
import 'section_divider.dart';

class ChatsList extends StatelessWidget {
  final List<ChatModel> chats;

  const ChatsList({super.key, required this.chats});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: chats.length,
      separatorBuilder: (context, index) => const SectionDivider(indent: 80),
      itemBuilder: (context, index) {
        return ChatWidget(chat: chats[index]);
      },
    );
  }
}
