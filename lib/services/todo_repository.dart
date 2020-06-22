import 'package:todo/models/todo.dart';

abstract class TodoRepository {
  Future save(Todo todo);

  Future<List<Todo>> fetch();
}
