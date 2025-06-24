import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'models/chat_model.dart';
import 'navigation/app_routes.dart';

class NewChatScreen extends StatefulWidget {
  const NewChatScreen({super.key});

  @override
  State<NewChatScreen> createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<ChatModel> filteredContacts = ChatModel.sampleChats;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterContacts);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterContacts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredContacts = ChatModel.sampleChats;
      } else {
        filteredContacts = ChatModel.sampleChats
            .where((contact) => contact.name.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        title: const Text(
          'New Chat',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search contacts',
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredContacts.length,
              itemBuilder: (context, index) {
                final contact = filteredContacts[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(contact.avatarAsset),
                  ),
                  title: Text(
                    contact.name,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    // Navigate to chat detail with the selected contact
                    Navigator.pushNamed(
                      context,
                      AppRoutes.chatDetail,
                      arguments: contact,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "new_chat_fab",
        backgroundColor: Colors.green,
        child: const Icon(Icons.group_add, color: Colors.white),
        onPressed: () {
          // Handle creating a new group
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Create new group feature coming soon'),
            ),
          );
        },
      ),
    );
  }
}
