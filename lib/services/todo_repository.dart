import 'package:flutter/foundation.dart';
import 'package:todo/models/todo.dart';

abstract class TodoRepository extends ChangeNotifier {
  bool isLoading = false;
  List<Todo> todos = List<Todo>();

  Future save(Todo todo);

  Future remove(Todo todo);

  Future<List<Todo>> fetch();
}
