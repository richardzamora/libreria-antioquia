import 'package:flutter/material.dart';
import 'package:libreria_antioquia/config/home_config.dart';
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
          SearcherWidget(
            onSearch: _presenter.searchBooks,
          ),
          const SizedBox(height: 20),
          if (_provider.books != null)
            Expanded(
              child: ListView.builder(
                itemCount: _provider.books?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap:
                        _presenter.showBookDetail(_provider.books?[index].isbn),
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
    // TODO: implement hideLoading
  }

  @override
  void showLoading() {
    // TODO: implement showLoading
  }
}
