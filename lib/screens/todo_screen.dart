import 'package:flutter/material.dart';
import 'package:todo/components/todo_screen_app_bar.dart';
import 'package:todo/models/todo.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final todos = List<Todo>();
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            TodoScreenAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: controller,
                          style: TextStyle(fontSize: 25),
                          decoration: InputDecoration(
                            hintText: "Todo",
                            hintStyle: TextStyle(fontSize: 25),
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
                              setState(() => todos.add(todo));
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
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, position) {
                  final todo = todos[position];
                  return Card(
                    child: CheckboxListTile(
                      key: Key(todo.content),
                      value: todo.isComplete,
                      onChanged: (isComplete) {
                        setState(() => todo.complete(isComplete));
                      },
                      title: Text(todo.content),
                      subtitle: Text("${todo.createdAt}"),
                    ),
                  );
                },
                childCount: todos.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
