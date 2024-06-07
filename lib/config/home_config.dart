import 'package:libreria_antioquia/domain/gateway/it_book_gateway.dart';
import 'package:libreria_antioquia/infraestructure/driven_adapter/it_book_api.dart';

class HomeConfig {
  HomeConfig({required this.bookGateway});
  ItBookGateway bookGateway;
}
