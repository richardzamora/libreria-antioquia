import 'package:libreria_antioquia/config/home_config.dart';
import 'package:libreria_antioquia/ui/home/interface/ui_library_interface.dart';

class HomePresenter {
  HomePresenter(this._interface, this._config);
  final UiLibraryInterface _interface;
  final HomeConfig _config;

  Future<void> searchBooks(String search) async {
    _interface.showLoading();

    _config.bookGateway.searchBooks(search).then((value) {
      _interface.hideLoading();
    });
  }

  Future<void> showBookDetail(String? isbn) async {
    _interface.showLoading();
    _config.bookGateway.showBookDetail(isbn).then((value) {
      _interface.hideLoading();
    });
  }
}
