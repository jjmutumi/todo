import 'package:flutter/material.dart';
import 'package:todo/components/todo_screen_app_bar.dart';
import 'package:todo/components/todo_screen_form.dart';
import 'package:todo/components/todo_screen_todo_list.dart';
import 'package:todo/services/shared_preferences_todo_repository.dart';
import 'package:todo/services/todo_repository.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TodoRepository todoRepository;

  @override
  void initState() {
    super.initState();
    todoRepository = SharedPreferencesTodoRepository();
    todoRepository.addListener(() {
      setState(() {});
    });
    todoRepository.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            TodoScreenAppBar(),
            TodoScreenForm(todoRepository: todoRepository),
            TodoScreenTodoList(todoRepository: todoRepository),
          ],
        ),
      ),
    );
  }
}
