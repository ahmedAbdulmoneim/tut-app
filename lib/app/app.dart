import 'package:flutter/material.dart';
import 'package:tut/presentation/routes_manager.dart';

import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  // named constructor

  MyApp._internal();

  static final MyApp _instance =
      MyApp._internal(); // singletone   (single instance)

  factory MyApp() => _instance; // factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
