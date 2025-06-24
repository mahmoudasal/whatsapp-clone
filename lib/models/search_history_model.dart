import 'package:flutter/material.dart';

class SearchHistoryModel extends ChangeNotifier {
  final List<String> _searchHistory = [];
  final int _maxEntries = 10;

  List<String> get searchHistory => _searchHistory;

  void addSearchTerm(String term) {
    if (term.isEmpty) return;

    // Remove if exists (to avoid duplicates)
    _searchHistory.remove(term);

    // Add to the beginning of the list
    _searchHistory.insert(0, term);

    // Trim list if needed
    if (_searchHistory.length > _maxEntries) {
      _searchHistory.removeLast();
    }

    notifyListeners();
  }

  void removeSearchTerm(String term) {
    _searchHistory.remove(term);
    notifyListeners();
  }

  void clearSearchHistory() {
    _searchHistory.clear();
    notifyListeners();
  }
}
