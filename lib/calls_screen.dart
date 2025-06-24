import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'models/call_model.dart';
import 'widgets/call_list_item.dart';
import 'widgets/search_bar.dart';
import 'widgets/section_divider.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  List<CallModel> calls = CallModel.sampleCalls;
  String searchQuery = '';
  void filterCalls(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        calls = CallModel.sampleCalls;
      } else {
        calls = CallModel.sampleCalls
            .where(
              (call) => call.name.toLowerCase().contains(query.toLowerCase()),
            )
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
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Center(
            child: GestureDetector(
              onTap: () {
                // Handle edit button tap
              },
              child: const Text(
                'Edit',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Calls',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.phone_badge_plus,
              color: Colors.blue,
              size: 24,
            ),
            onPressed: () {
              // Handle add call button tap
            },
          ),
          const SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: const Color(0xFFE0E0E0)),
        ),
      ),
      body: Column(
        children: [
          ChatSearchBar(onSearch: filterCalls),

          // Calls List
          Expanded(
            child: ListView.separated(
              itemCount: calls.length,
              separatorBuilder: (context, index) =>
                  const SectionDivider(indent: 80),
              itemBuilder: (context, index) {
                return CallListItem(call: calls[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(CupertinoIcons.phone, color: Colors.white),
        onPressed: () {
          // Handle new call
        },
      ),
    );
  }
}
