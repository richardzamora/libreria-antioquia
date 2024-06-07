import 'package:flutter/material.dart';
import 'package:libreria_antioquia/config/home_config.dart';
import 'package:libreria_antioquia/ui/book_details/pages/book_detail_page.dart';
import 'package:libreria_antioquia/ui/home/interface/ui_library_interface.dart';
import 'package:libreria_antioquia/ui/home/presenter/home_presenter.dart';
import 'package:libreria_antioquia/domain/provider/library_provider.dart';
import 'package:libreria_antioquia/ui/widgets/searcher_widget.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  static String routeName = "/home";
  const MyHomePage({
    super.key,
    required this.config,
  });
  final HomeConfig config;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements UiLibraryInterface {
  late HomePresenter _presenter;
  String search = "";
  late LibraryProvider _provider;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _presenter = HomePresenter(this, widget.config);
  }

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<LibraryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Biblioteca Antioquia'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: SearcherWidget(
              onSearch: (value) {
                if (value.isNotEmpty) {
                  _presenter.searchBooks(value);
                  _provider.addSearchHistory(value);
                }
              },
              historyData: _provider.searchHistory,
              onDeleteHistory: _provider.removeSearchHistory,
            ),
          ),
          const SizedBox(height: 20),
          if (isLoading)
            const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else if (_provider.books != null)
            Expanded(
              child: ListView.builder(
                itemCount: _provider.books?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => Navigator.pushNamed(
                        context, BookDetailPage.routeName,
                        arguments: _provider.books?[index]),
                    title: Text(_provider.books?[index].title ?? ''),
                    subtitle: Text(_provider.books?[index].subtitle ?? ''),
                  );
                },
              ),
            )
        ],
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
