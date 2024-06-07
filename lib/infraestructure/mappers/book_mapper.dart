import 'package:libreria_antioquia/domain/model/book_model.dart';
import 'package:libreria_antioquia/infraestructure/model/book_model_response.dart';

class BookMapper {
  BookModel bookModelFromBookResponse(Book bookResponse) {
    return BookModel(
      title: bookResponse.title,
      subtitle: bookResponse.subtitle,
      isbn: bookResponse.isbn13,
      price: bookResponse.price,
      imageUrl: bookResponse.image,
    );
  }
}
