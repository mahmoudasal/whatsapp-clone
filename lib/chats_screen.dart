import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'models/chat_model.dart';
import 'models/search_history_model.dart';
import 'navigation/app_routes.dart';
import 'utils/debouncer.dart';
import 'widgets/archived_chats_item.dart';
import 'widgets/broadcast_list_item.dart';
import 'widgets/chats_app_bar.dart';
import 'widgets/chats_list.dart';
import 'widgets/search_bar.dart';
import 'widgets/section_divider.dart';
import 'widgets/status_section.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<ChatModel> filteredChats = ChatModel.sampleChats;
  String searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  final SearchHistoryModel _searchHistory = SearchHistoryModel();
  final Debouncer _debouncer = Debouncer(milliseconds: 500);
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _isSearching = _searchController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  void filterChats(String query) {
    _debouncer.run(() {
      setState(() {
        searchQuery = query;
        if (query.isEmpty) {
          filteredChats = ChatModel.sampleChats;
        } else {
          filteredChats = ChatModel.sampleChats
              .where(
                (chat) =>
                    chat.name.toLowerCase().contains(query.toLowerCase()) ||
                    chat.message.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();

          // Add to search history when user completes search
          if (query.length > 2) {
            _searchHistory.addSearchTerm(query);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ChatsAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ChatSearchBar(onSearch: filterChats),
          ),
          if (_isSearching && _searchHistory.searchHistory.isNotEmpty)
            _buildSearchHistory(),
          if (!_isSearching) ...[
            const ArchivedChatsItem(count: 3),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: BroadcastListItem(),
            ),
            const SectionDivider(),
          ],
          Expanded(child: ChatsList(chats: filteredChats)),
          if (!_isSearching) const StatusSection(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "chats_fab",
        backgroundColor: Colors.blue,
        child: const Icon(CupertinoIcons.pencil, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.newChat);
        },
      ),
    );
  }

  Widget _buildSearchHistory() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Searches',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              if (_searchHistory.searchHistory.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _searchHistory.clearSearchHistory();
                    });
                  },
                  child: const Text(
                    'Clear All',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _searchHistory.searchHistory
                .take(5)
                .map(
                  (term) => GestureDetector(
                    onTap: () {
                      _searchController.text = term;
                      filterChats(term);
                    },
                    child: Chip(
                      backgroundColor: Colors.grey[200],
                      label: Text(term),
                      deleteIcon: const Icon(Icons.close, size: 16),
                      onDeleted: () {
                        setState(() {
                          _searchHistory.removeSearchTerm(term);
                        });
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
