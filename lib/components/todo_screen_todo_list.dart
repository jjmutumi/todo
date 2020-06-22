import 'package:flutter/material.dart';
import 'package:todo/services/todo_repository.dart';

class TodoScreenTodoList extends StatelessWidget {
  const TodoScreenTodoList({
    Key key,
    @required this.todoRepository,
  }) : super(key: key);

  final TodoRepository todoRepository;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, position) {
          final todo = todoRepository.todos[position];
          return Card(
            child: CheckboxListTile(
              key: Key(todo.content),
              value: todo.isComplete,
              onChanged: (isComplete) {
                todo.complete(isComplete);
                todoRepository.save(todo);
              },
              title: Text(todo.content),
              subtitle: Text("${todo.createdAt}"),
            ),
          );
        },
        childCount: todoRepository.todos.length,
      ),
    );
  }
}
