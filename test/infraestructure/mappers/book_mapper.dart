import 'package:flutter_test/flutter_test.dart';
import 'package:libreria_antioquia/infraestructure/mappers/book_mapper.dart';
import 'package:libreria_antioquia/infraestructure/model/book_model_response.dart';

void main() {
  group('book mapper', () {
    test('bookResponse to bookModel', () {
      final bookResponse = Book(
        title: 'test',
        subtitle: 'subtitle',
        isbn13: '4937852648645',
      );
      final mapper = BookMapper();
      final bookModel = mapper.bookModelFromBookResponse(bookResponse);
      expect(bookModel.title, 'test');
      expect(bookModel.isbn, '4937852648645');
    });
  });
}
