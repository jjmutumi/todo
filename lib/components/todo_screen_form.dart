
import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/services/todo_repository.dart';

class TodoScreenForm extends StatefulWidget {
  const TodoScreenForm({
    Key key,
    @required this.todoRepository,
  }) : super(key: key);
  final TodoRepository todoRepository;

  @override
  _TodoScreenFormState createState() => _TodoScreenFormState();
}

class _TodoScreenFormState extends State<TodoScreenForm> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: controller,
                  style: TextStyle(fontSize: 30),
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: "Todo",
                    hintStyle: TextStyle(fontSize: 30),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Card(
                color: Colors.blue,
                margin: EdgeInsets.zero,
                shape: ContinuousRectangleBorder(),
                elevation: 0,
                child: InkWell(
                  onTap: () {
                    if (controller.text.isNotEmpty) {
                      final todo = Todo(content: controller.text);
                      widget.todoRepository.save(todo);
                      controller.text = "";
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "ADD",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
