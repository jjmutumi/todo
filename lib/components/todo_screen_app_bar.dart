import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/services/authentication_service.dart';
import 'package:todo/services/shared_preferences_authentication_service.dart';

class TodoScreenAppBar extends StatelessWidget {
  const TodoScreenAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text("TODOS"),
      pinned: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.power_settings_new),
          onPressed: () async {
            final proceed = await showDialog(
              context: context,
              barrierDismissible: false,
              child: AlertDialog(
                content: Text("Do you want to sign out?"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text("NO"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text("YES"),
                  )
                ],
              ),
            );
            if (proceed != null && proceed) {
              await Provider.of<AuthenticationService>(context, listen: false).signOut();

              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/", (route) => route != null);
            }
          },
        )
      ],
    );
  }
}
