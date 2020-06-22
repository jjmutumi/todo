import 'package:flutter/widgets.dart';
import 'package:todo/screens/login_screen.dart';
import 'package:todo/screens/splash_screen.dart';

import 'screens/todo_screen.dart';


final Map<String, Widget Function(BuildContext)> appRoutes = {
  "/": (context) => SplashScreen(),
  "/login": (context) => LoginScreen(),
  "/todo": (context) => TodoScreen(),
};