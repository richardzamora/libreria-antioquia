import 'package:flutter_test/flutter_test.dart';
import 'infraestructure/mappers/book_mapper.dart' as book_mapper;
import 'infraestructure/mappers/book_detail_mapper.dart' as book_detail_mapper;
import 'infraestructure/model/book_model_response_test.dart'
    as books_model_response_test;
import 'infraestructure/model/book_detail_response_test.dart'
    as book_detail_response_test;
import 'ui/routes/book_detail_routes_test.dart' as books_detail_routes_test;
import 'ui/routes/home_routes_test.dart' as home_routes_test;

void main() {
  group('infraestructure', () {
    book_mapper.main();
    book_detail_mapper.main();
    books_model_response_test.main();
    book_detail_response_test.main();
  });
  group('ui', () {
    books_detail_routes_test.main();
    home_routes_test.main();
  });
}
