import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/models/user.dart';
import 'package:todo/services/authentication_service.dart';
import 'package:todo/services/shared_preferences_authentication_service.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _waitForIt();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Text(
          "Splash",
          style: TextStyle(fontSize: 22),
        )),
      ),
    );
  }

  _waitForIt() async {
    await Future.delayed(Duration(seconds: 2));

    AuthenticationService authenticationService =
        SharedPreferencesAuthenticationService();
    User user = await authenticationService.currentUser();

    if (user == null) {
      Navigator.of(context).pushReplacementNamed("/login");
    } else {
      Navigator.of(context).pushReplacementNamed("/todo");
    }
  }
}
