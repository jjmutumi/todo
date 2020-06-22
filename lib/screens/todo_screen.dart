import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/todo_screen_app_bar.dart';
import 'package:todo/components/todo_screen_form.dart';
import 'package:todo/components/todo_screen_todo_list.dart';
import 'package:todo/services/todo_repository.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TodoRepository>(context, listen: false).fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            Consumer<TodoRepository>(builder: (context, todoRepository, child) {
          return CustomScrollView(
            slivers: <Widget>[
              TodoScreenAppBar(),
              TodoScreenForm(todoRepository: todoRepository),
              TodoScreenTodoList(todoRepository: todoRepository),
            ],
          );
        }),
      ),
    );
  }
}
