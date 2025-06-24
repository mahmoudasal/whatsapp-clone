import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'models/status_model.dart';
import 'widgets/status_list_item.dart';
import 'widgets/section_divider.dart';
import 'widgets/search_bar.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  List<StatusModel> statuses = StatusModel.sampleStatuses;
  String searchQuery = '';
  void filterStatuses(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        statuses = StatusModel.sampleStatuses;
      } else {
        statuses = StatusModel.sampleStatuses
            .where(
              (status) =>
                  status.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final myStatus = statuses.first; // Assuming first item is my status
    final recentUpdates = statuses
        .where((status) => !status.isViewed && status != myStatus)
        .toList();
    final viewedUpdates = statuses
        .where((status) => status.isViewed && status != myStatus)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Center(
            child: GestureDetector(
              onTap: () {
                // Handle privacy button tap
              },
              child: const Text(
                'Privacy',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Status',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: const Color(0xFFE0E0E0)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChatSearchBar(onSearch: filterStatuses),

            // My Status
            StatusListItem(status: myStatus, isMyStatus: true),
            const SectionDivider(indent: 80),

            // Recent Updates
            if (recentUpdates.isNotEmpty) ...[
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
                child: Text(
                  'RECENT UPDATES',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ...recentUpdates
                  .map(
                    (status) => Column(
                      children: [
                        StatusListItem(status: status),
                        if (status != recentUpdates.last)
                          const SectionDivider(indent: 80),
                      ],
                    ),
                  )
                  .toList(),
              const SectionDivider(),
            ],

            // Viewed Updates
            if (viewedUpdates.isNotEmpty) ...[
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
                child: Text(
                  'VIEWED UPDATES',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ...viewedUpdates
                  .map(
                    (status) => Column(
                      children: [
                        StatusListItem(status: status),
                        if (status != viewedUpdates.last)
                          const SectionDivider(indent: 80),
                      ],
                    ),
                  )
                  .toList(),
            ],
            // Add padding at the bottom to ensure content doesn't get hidden behind FAB
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'status_text',
            mini: true,
            backgroundColor: Colors.grey[200],
            child: const Icon(CupertinoIcons.pencil, color: Colors.green),
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'status_camera',
            backgroundColor: Colors.green,
            child: const Icon(CupertinoIcons.camera, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
