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
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Dismissible(
              key: Key(todo.id),
              onDismissed: (direction) {
                todoRepository.remove(todo);

                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Successfully removed: ${todo.content}"),
                    duration: Duration(seconds: 2),
                    backgroundColor: Theme.of(context).primaryColor,
                    action: SnackBarAction(
                      textColor:
                          Theme.of(context).primaryTextTheme.subtitle1.color,
                      label: "UNDO",
                      onPressed: () => todoRepository.save(todo),
                    ),
                  ),
                );
              },
              child: Card(
                elevation: todo.isComplete ? 0 : null,
                color: todo.isComplete ? Colors.grey[200] : null,
                child: CheckboxListTile(
                  value: todo.isComplete,
                  onChanged: (isComplete) {
                    todo.complete(isComplete);
                    todoRepository.save(todo);
                  },
                  title: Text(
                    todo.content,
                    style: TextStyle(
                      fontSize: 26,
                      decoration: todo.isComplete
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text("${todo.createdAt}"),
                ),
              ),
            ),
          );
        },
        childCount: todoRepository.todos.length,
      ),
    );
  }
}
