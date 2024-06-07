import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:libreria_antioquia/infraestructure/model/book_detail_response.dart';

void main() {
  group("book detail response test", () {
    test("BookDetailResponse from json string and to json string test", () {
      final mockString = json.encode(mockResponse);
      final booksResponse = bookDetailResponseFromJson(mockString);
      expect(booksResponse.isbn13, '9781801816984');
      final booksAsString = bookDetailResponseToJson(booksResponse);
      expect(booksAsString, mockString);
    });
  });
}

Map mockResponse = {
  "error": "0",
  "title": "Building Games with Flutter",
  "subtitle":
      "The ultimate guide to creating multiplatform games using the Flame engine in Flutter 3",
  "authors": "Paul Teale",
  "publisher": "Packt Publishing",
  "language": "English",
  "isbn10": "1801816980",
  "isbn13": "9781801816984",
  "pages": "224",
  "year": "2022",
  "rating": "4",
  "desc":
      "With its powerful tools and quick implementation capabilities, Flutter provides a new way to build scalable cross-platform apps. In this book, you&#039;ll learn how to build on your knowledge and use Flutter as the foundation for creating games.This game development book takes a hands-on approach to...",
  "price": "\$39.99",
  "image": "https://itbook.store/img/books/9781801816984.png",
  "url": "https://itbook.store/books/9781801816984",
  'pdf': null
};
