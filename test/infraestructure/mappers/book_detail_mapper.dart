import 'package:flutter_test/flutter_test.dart';
import 'package:libreria_antioquia/infraestructure/mappers/book_detail_mapper.dart';
import 'package:libreria_antioquia/infraestructure/model/book_detail_response.dart';

void main() {
  group('bookDetail mapper', () {
    test('bookDetailResponse to bookDetailModel', () {
      final bookResponse = BookDetailResponse(
        title: 'test',
        subtitle: 'subtitle',
        isbn13: '4937852648645',
      );
      final mapper = BookDetailMapper();
      final bookModel = mapper.bookDetailFromDetailResponse(bookResponse);
      expect(bookModel.title, 'test');
      expect(bookModel.isbn13, '4937852648645');
    });
  });
}
