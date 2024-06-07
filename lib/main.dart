import 'package:flutter/material.dart';
import 'package:libreria_antioquia/infraestructure/helpers/load_env_helper.dart';
import 'package:libreria_antioquia/setup.dart';
import 'package:libreria_antioquia/domain/provider/library_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() async {
  env = await LoadEnvHelper.loadEnvFile('assets/env/prod/.env_prod');
  await initApp();
}

Future<void> initApp() async {
  final List<SingleChildWidget> items = [
    ChangeNotifierProvider(create: (_) => LibraryProvider()),
  ];
  WidgetsFlutterBinding.ensureInitialized();

  final configuredApp = await Setup.getApp(providers: items);
  runApp(configuredApp);
}
