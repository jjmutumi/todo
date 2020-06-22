import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/services/todo_repository.dart';

class SharedPreferencesTodoRepository extends TodoRepository {
  bool _fetched = false;
  String _prefKey = "TODO";

  Future<SharedPreferences> prefs() async =>
      await SharedPreferences.getInstance();

  Future save(Todo todo) async {
    // if the in memory list has never been fetched from the disk, then do that
    if (!_fetched) {
      todos = await fetch();
    }

    // either add new or replace in todos list if updating
    bool found = false;
    for (int i = 0; i < todos.length; i++) {
      final item = todos[i];
      if (item.id == todo.id) {
        todos[i] = item;
        found = true;
        break;
      }
    }
    if (!found) {
      todos.add(todo);
    }

    // save the todos to SharedPreferences
    await (await prefs())
        .setString(_prefKey, jsonEncode(todos.map((e) => e.toJson()).toList()));

    // tell listeners that data has been saved
    notifyListeners();
  }

  Future remove(Todo todo) async {
    // if the in memory list has never been fetched from the disk, then do that
    if (!_fetched) {
      todos = await fetch();
    }

    // got through todos and remove correct one
    for (int i = 0; i < todos.length; i++) {
      final item = todos[i];
      if (item.id == todo.id) {
        todos.removeAt(i);
        break;
      }
    }

    // save the todos to SharedPreferences
    await (await prefs())
        .setString(_prefKey, jsonEncode(todos.map((e) => e.toJson()).toList()));

    // tell listeners that data has been removed
    notifyListeners();
  }

  Future<List<Todo>> fetch() async {
    // only indicate isLoading on the first retreival
    isLoading = !_fetched;
    notifyListeners();

    // get & populate list of todos from json string stored in SharedPreferences
    final todoString = (await prefs()).getString(_prefKey);
    if (todoString != null && todoString.isNotEmpty) {
      try {
        final List<Todo> diskTodos = [];
        final List items = jsonDecode(todoString);
        for (Map<String, dynamic> item in items) {
          diskTodos.add(Todo.fromJson(item));
        }
        todos = diskTodos;
      } catch (err, trace) {
        print("$err $trace");
      }
    }

    // tell listeners that data has been fetched
    isLoading = false;
    notifyListeners();

    _fetched = true;
    return todos;
  }
}
