import 'package:libreria_antioquia/domain/model/book_model.dart';

abstract class ItBookGateway {
  Future<List<BookModel>> searchBooks(String search);

  void showBookDetail(String? isbn);
}
