import 'package:flutter/material.dart';
import 'package:libreria_antioquia/ui/book_details/pages/book_detail_page.dart';
import 'package:libreria_antioquia/ui/helpers/routes/book_detail_routes.dart';
import 'package:libreria_antioquia/ui/helpers/routes/home_routes.dart';
import 'package:libreria_antioquia/ui/home/pages/my_home_page.dart';

class Routes {
  Map<String, WidgetBuilder> routes() {
    return {
      MyHomePage.routeName: HomeRoutes.getHomePage,
      BookDetailPage.routeName: BookDetailRoutes.getBookDetailPage,
    };
  }
}
