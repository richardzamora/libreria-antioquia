import 'package:flutter/material.dart';
import 'package:libreria_antioquia/domain/model/book_model.dart';

class LibraryProvider with ChangeNotifier {
  List<BookModel>? _books;
  List<BookModel>? get books => _books;

  set books(List<BookModel>? books) {
    _books = books;
    notifyListeners();
  }
}
