import 'package:libreria_antioquia/config/home_config.dart';
import 'package:libreria_antioquia/ui/home/interface/ui_library_interface.dart';

class HomePresenter {
  HomePresenter(this._interface, this._config);
  final UiLibraryInterface _interface;
  final HomeConfig _config;

  Future<void> searchBooks(String search) async {
    _interface.showLoading();
    _config.bookGateway.searchBooks(search);
  }

  showBookDetail(String? isbn) {
    _config.bookGateway.showBookDetail(isbn);
  }
}
