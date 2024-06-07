import 'package:flutter/material.dart';
import 'package:libreria_antioquia/config/home_config.dart';
import 'package:libreria_antioquia/domain/model/book_detail_model.dart';
import 'package:libreria_antioquia/domain/model/book_model.dart';
import 'package:libreria_antioquia/domain/provider/library_provider.dart';
import 'package:libreria_antioquia/ui/home/interface/ui_library_interface.dart';
import 'package:libreria_antioquia/ui/home/presenter/home_presenter.dart';
import 'package:provider/provider.dart';

class BookDetailPage extends StatefulWidget {
  static String routeName = "/bookDetail";

  const BookDetailPage({required this.config, this.model, super.key});
  final HomeConfig config;
  final BookModel? model;

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage>
    implements UiLibraryInterface {
  late HomePresenter _presenter;
  String search = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _presenter = HomePresenter(this, widget.config);
    _presenter.showBookDetail(widget.model?.isbn);
  }

  @override
  Widget build(BuildContext context) {
    BookDetailModel? bookDetail =
        Provider.of<LibraryProvider>(context).bookDetail;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model?.isbn ?? ''),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: SizedBox(
                            height: 300,
                            child: Image.network(bookDetail?.image ?? ''))),
                    Text("Título: ${bookDetail?.title ?? ''}"),
                    Text("Subtitulo: ${bookDetail?.subtitle ?? ''}"),
                    Text("Autor(es): ${bookDetail?.authors ?? ''}"),
                    Text("Descripción: ${bookDetail?.desc ?? ''}"),
                    Text("Idioma: ${bookDetail?.language ?? ''}"),
                    Text("Precio: ${bookDetail?.price ?? ''}"),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  void hideLoading() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void showLoading() {
    setState(() {
      isLoading = true;
    });
  }
}
