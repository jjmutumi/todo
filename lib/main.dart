import 'package:flutter/material.dart';
import 'package:todo/routes.dart';
import 'package:todo/themes/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Demo',
      theme: theme,
      initialRoute: "/",
      routes: appRoutes,
    );
  }
}

