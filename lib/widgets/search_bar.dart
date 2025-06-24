import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChatSearchBar extends StatelessWidget {
  final Function(String) onSearch;

  const ChatSearchBar({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      child: CupertinoSearchTextField(
        placeholder: 'Ask Meta Ai or Search',
        prefixIcon: const Icon(CupertinoIcons.search, color: Colors.grey),
        style: const TextStyle(color: Colors.black87, fontSize: 16),
        backgroundColor: Colors.grey[100],
        onChanged: onSearch,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        borderRadius: BorderRadius.circular(10),
        placeholderStyle: const TextStyle(color: Colors.grey, fontSize: 16),
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final Function(String)? onSearch;
  final TextEditingController? controller;

  const SearchBarWidget({
    super.key,
    required this.hintText,
    this.onSearch,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CupertinoSearchTextField(
        placeholder: hintText,
        controller: controller,
        prefixIcon: const Icon(CupertinoIcons.search, color: Colors.grey),
        style: const TextStyle(color: Colors.black87, fontSize: 16),
        backgroundColor: Colors.grey[200],
        onChanged: onSearch,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
