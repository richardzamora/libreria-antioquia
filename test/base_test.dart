import 'package:flutter/material.dart';
import 'package:libreria_antioquia/domain/provider/library_provider.dart';
import 'package:libreria_antioquia/setup.dart';
import 'package:libreria_antioquia/ui/helpers/routes/routes.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class BaseTest {
  BaseTest._();

  static Future<AppConfig> appTest(Widget fakeHome, {args}) async {
    final List<SingleChildWidget> itemsProvider = [
      ChangeNotifierProvider(create: (_) => LibraryProvider()),
    ];
    return AppConfig(
      apiBaseUrl: 'http',
      appName: 'libreria',
      child: MultiProvider(
        providers: [...itemsProvider],
        child: _Base(
          home: fakeHome,
          args: args,
        ),
      ),
    );
  }
}

class _Base extends StatelessWidget {
  const _Base({required this.home, this.args});
  final Widget home;
  final Object? args;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Libreria antioquia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: home,
      routes: Routes().routes(),
      onGenerateRoute: (setting) => MaterialPageRoute(
          settings: RouteSettings(arguments: args), builder: (context) => home),
    );
  }
}
