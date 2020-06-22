import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    Navigator.of(context).pushNamed("/login");
  }
}
