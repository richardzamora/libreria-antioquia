import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:libreria_antioquia/infraestructure/model/book_model_response.dart';

void main() {
  group("book model response test", () {
    test("BookModelResponse from json string and to json string test", () {
      final mockString = json.encode(mockResponse);
      final booksResponse = booksResponseFromJson(mockString);
      expect(booksResponse.books![0].isbn13, '9781801816984');
      final booksAsString = booksResponseToJson(booksResponse);
      expect(booksAsString, mockString);
    });
  });
}

Map mockResponse = {
  "error": "0",
  "total": "9",
  "page": "1",
  "books": [
    {
      "title": "Building Games with Flutter",
      "subtitle":
          "The ultimate guide to creating multiplatform games using the Flame engine in Flutter 3",
      "isbn13": "9781801816984",
      "price": "\$39.99",
      "image": "https://itbook.store/img/books/9781801816984.png",
      "url": "https://itbook.store/books/9781801816984"
    },
    {
      "title": "Taking Flutter to the Web",
      "subtitle":
          "Learn how to build cross-platform UIs for web and mobile platforms using Flutter for Web",
      "isbn13": "9781801817714",
      "price": "\$44.99",
      "image": "https://itbook.store/img/books/9781801817714.png",
      "url": "https://itbook.store/books/9781801817714"
    },
    {
      "title": "Flutter Succinctly",
      "subtitle": "",
      "isbn13": "1001657540815",
      "price": "\$0.00",
      "image": "https://itbook.store/img/books/1001657540815.png",
      "url": "https://itbook.store/books/1001657540815"
    },
    {
      "title": "Flutter and Dart Cookbook",
      "subtitle": "Developing Full-Stack Applications for the Cloud",
      "isbn13": "9781098119515",
      "price": "\$50.52",
      "image": "https://itbook.store/img/books/9781098119515.png",
      "url": "https://itbook.store/books/9781098119515"
    },
    {
      "title": "Beginning App Development with Flutter",
      "subtitle": "Create Cross-Platform Mobile Apps",
      "isbn13": "9781484251805",
      "price": "\$30.88",
      "image": "https://itbook.store/img/books/9781484251805.png",
      "url": "https://itbook.store/books/9781484251805"
    },
  ]
};
