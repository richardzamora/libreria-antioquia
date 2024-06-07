import 'package:flutter/material.dart';
import 'package:libreria_antioquia/config/home_config.dart';
import 'package:libreria_antioquia/infraestructure/driven_adapter/it_book_api.dart';
import 'package:libreria_antioquia/ui/book_details/pages/book_detail_page.dart';

import '../../../domain/model/book_model.dart';

class BookDetailRoutes {
  BookDetailRoutes._();
  static BookDetailPage getBookDetailPage(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    BookModel? bookModel;
    if (args is BookModel) {
      bookModel = args;
    }
    return BookDetailPage(
        config: HomeConfig(bookGateway: ItBookApi(context)), model: bookModel);
  }
}
