import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/routes.dart';
import 'package:todo/services/authentication_service.dart';
import 'package:todo/services/shared_preferences_authentication_service.dart';
import 'package:todo/services/shared_preferences_todo_repository.dart';
import 'package:todo/services/todo_repository.dart';
import 'package:todo/themes/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (context) => SharedPreferencesAuthenticationService(),
          ),
          ChangeNotifierProvider<TodoRepository>(
            create: (context) => SharedPreferencesTodoRepository(),
          ),
        ],
        child: MaterialApp(
          title: 'Todo Demo',
          theme: theme,
          initialRoute: "/",
          routes: appRoutes,
        ));
  }
}
