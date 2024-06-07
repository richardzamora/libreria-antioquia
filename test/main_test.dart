import 'package:flutter_test/flutter_test.dart';
import 'infraestructure/mappers/book_mapper.dart' as book_mapper;
import 'infraestructure/mappers/book_detail_mapper.dart' as book_detail_mapper;

void main() {
  group('infraestructure', () {
    book_mapper.main();
    book_detail_mapper.main();
  });
  group('ui', () {});
}
