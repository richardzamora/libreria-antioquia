import 'package:flutter/material.dart';
import 'package:libreria_antioquia/config/home_config.dart';
import 'package:libreria_antioquia/infraestructure/driven_adapter/it_book_api.dart';
import 'package:libreria_antioquia/ui/home/pages/my_home_page.dart';

class HomeRoutes {
  HomeRoutes._();
  static MyHomePage getHomePage(BuildContext context) =>
      MyHomePage(config: HomeConfig(bookGateway: ItBookApi(context)));
}
