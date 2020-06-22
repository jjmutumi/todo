import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const LoginButton({
    Key key,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      child: DefaultTextStyle(
          style: TextStyle(
            color: Theme.of(context).primaryTextTheme.subtitle1.color,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          child: child),
      onPressed: onPressed,
    );
  }
}
