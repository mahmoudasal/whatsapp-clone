import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'models/chat_model.dart';
import 'models/search_history_model.dart';
import 'navigation/app_routes.dart';
import 'utils/debouncer.dart';
import 'widgets/archived_chats_item.dart';
import 'chat_widget.dart';
import 'widgets/search_bar.dart';

// Using NavigationService from app_routes.dart

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
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              pinned: true,
              snap: true,
              elevation: 0,
              backgroundColor: Colors.white,
              expandedHeight: 200.0,
              stretch: true,
              leadingWidth: 80,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      // Handle edit button tap
                    },
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.ellipsis),
                    ),
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.camera,
                    color: Colors.green,
                    size: 24,
                  ),
                  onPressed: () {
                    // Handle camera button tap
                  },
                ),
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.square_pencil,
                    color: Colors.green,
                    size: 24,
                  ),
                  onPressed: () {
                    // Handle new message button tap
                  },
                ),
                const SizedBox(width: 4),
              ],
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 16.0, bottom: 90.0),
                title: const Text(
                  'Chats',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
                expandedTitleScale: 1.5,
                collapseMode: CollapseMode.parallax,
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Column(
                    children: [
                      ChatSearchBar(onSearch: filterChats),
                      if (!_isSearching)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _buildFilterChip('All', true),
                                const SizedBox(width: 8),
                                _buildFilterChip('Unread', false),
                                const SizedBox(width: 8),
                                _buildFilterChip('Favourites', false),
                                const SizedBox(width: 8),
                                _buildFilterChip('Groups', false),
                                const SizedBox(width: 8),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: CustomScrollView(
          slivers: [
            if (!_isSearching)
              const SliverToBoxAdapter(child: ArchivedChatsItem(count: 3)),
            if (_isSearching && _searchHistory.searchHistory.isNotEmpty)
              SliverToBoxAdapter(child: _buildSearchHistory()),
            SliverList.builder(
              itemCount: filteredChats.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ChatWidget(chat: filteredChats[index]),
                    if (index < filteredChats.length - 1)
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: Container(height: 0.5, color: Colors.grey[300]),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "chats_fab",
        backgroundColor: Colors.green,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          NavigationService.navigateTo(AppRoutes.newChat);
        },
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 14,
        ),
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
                    style: TextStyle(fontSize: 14, color: Colors.green),
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
