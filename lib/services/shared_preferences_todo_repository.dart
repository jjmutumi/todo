import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/services/todo_repository.dart';

class SharedPreferencesTodoRepository extends TodoRepository {
  Future save(Todo todo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final existing = await fetch();
    existing.add(todo);
    await prefs.setString("TODO", jsonEncode(existing.map((e) => e.toJson())));
  }

  Future<List<Todo>> fetch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final todoString = prefs.getString("TODO");
    if (todoString != null && todoString.isNotEmpty) {
      try {
        return (jsonDecode(todoString) as List<Map<String, dynamic>>)
            .map((json) => Todo.fromJson(json))
            .toList();
      } catch (err) {
        print("$err");
      }
    }
    return [];
  }
}
