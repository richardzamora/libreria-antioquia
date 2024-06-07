import 'package:libreria_antioquia/domain/model/book_detail_model.dart';
import 'package:libreria_antioquia/infraestructure/model/book_detail_response.dart';

class BookDetailMapper {
  BookDetailModel bookDetailFromDetailResponse(
      BookDetailResponse bookDetailResponse) {
    return BookDetailModel(
      title: bookDetailResponse.title,
      subtitle: bookDetailResponse.subtitle,
      authors: bookDetailResponse.authors,
      desc: bookDetailResponse.desc,
      isbn10: bookDetailResponse.isbn10,
      isbn13: bookDetailResponse.isbn13,
      price: bookDetailResponse.price,
      image: bookDetailResponse.image,
    );
  }
}
