import 'package:libreria_antioquia/domain/model/book_detail_model.dart';
import 'package:libreria_antioquia/domain/model/book_model.dart';

abstract class ItBookGateway {
  Future<List<BookModel>> searchBooks(String search);

  Future<BookDetailModel> showBookDetail(String? isbn);
}
