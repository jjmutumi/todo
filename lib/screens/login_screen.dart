import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/login_button.dart';
import 'package:todo/models/user.dart';
import 'package:todo/services/authentication_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = TextEditingController();
  String error;

  @override
  Widget build(BuildContext context) {
    final authenticationService = Provider.of<AuthenticationService>(context);

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(height: MediaQuery.of(context).size.height / 4),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controller,
                          autofocus: true,
                          style: TextStyle(fontSize: 30),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Your name",
                            labelStyle: TextStyle(fontSize: 30),
                            helperText: "Please enter your name",
                            errorText: error,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LoginButton(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Continue"),
                          ),
                          onPressed: () async {
                            if (_isValid(controller.text)) {
                              final user = User(name: controller.text);
                              await authenticationService.signIn(user);

                              Navigator.of(context)
                                  .pushReplacementNamed("/todo");
                            } else {
                              setState(() => error = "This is required");
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  bool _isValid(String input) => input.isNotEmpty;
}
