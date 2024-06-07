import 'package:flutter/material.dart';
import 'package:libreria_antioquia/config/main_config.dart';
import 'package:libreria_antioquia/domain/model/book_detail_model.dart';
import 'package:libreria_antioquia/domain/model/book_model.dart';

class LibraryProvider with ChangeNotifier {
  final _SEARCH_HISTORY_CACHE_KEY = 'search-history';

  LibraryProvider() {
    loadCacheHistory();
  }
  final _cache = MainConfig.cacheStorage;
  List<BookModel>? _books;

  List<BookModel>? get books => _books;
  set books(List<BookModel>? value) {
    _books = value;
    notifyListeners();
  }

  BookDetailModel? _bookDetail;
  BookDetailModel? get bookDetail => _bookDetail;
  set bookDetail(BookDetailModel? value) {
    _bookDetail = value;
    notifyListeners();
  }

  List<String> _searchHistory = [];
  List<String> get searchHistory => _searchHistory;
  Future<void> loadCacheHistory() async {
    searchHistory = await _cache.getListString(_SEARCH_HISTORY_CACHE_KEY);
    notifyListeners();
  }

  set searchHistory(List<String>? value) {
    _searchHistory = value ?? [];
    _cache.setListString(_SEARCH_HISTORY_CACHE_KEY, _searchHistory);
    notifyListeners();
  }

  addSearchHistory(String value) {
    if (_searchHistory.length > 4) {
      _searchHistory.removeAt(4);
    }
    _searchHistory = [value, ..._searchHistory];
    _cache.setListString(_SEARCH_HISTORY_CACHE_KEY, _searchHistory);
    notifyListeners();
  }

  removeSearchHistory(String value) {
    _searchHistory.remove(value);
    _cache.setListString(_SEARCH_HISTORY_CACHE_KEY, _searchHistory);
    notifyListeners();
  }
}
