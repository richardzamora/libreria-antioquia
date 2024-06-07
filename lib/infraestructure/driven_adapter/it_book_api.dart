import 'package:flutter/material.dart';
import 'package:libreria_antioquia/domain/gateway/it_book_gateway.dart';
import 'package:libreria_antioquia/domain/model/book_model.dart';
import 'package:libreria_antioquia/domain/provider/library_provider.dart';
import 'package:libreria_antioquia/infraestructure/model/book_model_response.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ItBookApi implements ItBookGateway {
  ItBookApi(BuildContext context) {
    _libraryProvider = Provider.of<LibraryProvider>(context, listen: false);
  }
  late LibraryProvider _libraryProvider;
  @override
  Future<List<BookModel>> searchBooks(String search) async {
    final response = await http.Client().get(
        Uri.parse('https://api.itbook.store/1.0/search/$search'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final booksResponse = booksResponseFromJson(response.body);
      List<BookModel> books = [];
      for (Book book in booksResponse.books ?? []) {
        books.add(BookModel(
          title: book.title,
          subtitle: book.subtitle,
          isbn: book.isbn13,
          price: book.price,
          imageUrl: book.image,
        ));
      }
      _libraryProvider.books = books;
      return books;
    }

    List<BookModel> result = [];
    _libraryProvider.books = result;
    return result;
  }

  @override
  void showBookDetail(String? isbn) async {}
}
