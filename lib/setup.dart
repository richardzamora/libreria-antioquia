import 'package:flutter/material.dart';
import 'package:libreria_antioquia/my_app.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Map<String, String> env = {};

class Setup {
  static Future<AppConfig> getApp(
      {required List<SingleChildWidget> providers}) async {
    return AppConfig(
      appName: env['APP_NAME']!,
      apiBaseUrl: env['BASE_URL']!,
      child: MultiProvider(providers: providers, child: const MyApp()),
    );
  }
}

class AppConfig extends InheritedWidget {
  const AppConfig({
    required this.appName,
    required this.apiBaseUrl,
    required super.child,
    super.key,
  });

  final String appName;
  final String apiBaseUrl;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<AppConfig>();
}
