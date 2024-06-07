import 'package:flutter/material.dart';
import 'package:libreria_antioquia/ui/helpers/routes/routes.dart';
import 'package:libreria_antioquia/ui/home/pages/my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Routes routes = Routes();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Libreria antioquia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: routes.routes(),
      initialRoute: MyHomePage.routeName,
    );
  }
}
