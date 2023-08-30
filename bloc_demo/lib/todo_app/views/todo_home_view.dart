import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_bloc.dart';
import '../models/todo_model.dart';

class ToDoHomeView extends StatelessWidget {
  const ToDoHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do BLoC"),
      ),
      body: Center(
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state.todoStatus == TodoStatus.initial) {
              return const CircularProgressIndicator();
            } else if (state.todoStatus == TodoStatus.success) {
              return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(state.todos[index].title),
                      subtitle: Text(state.todos[index].message),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: state.todos[index].isDone,
                            onChanged: (value) =>
                                context.read<TodoBloc>().add(UpdateTodo(index)),
                          ),
                          IconButton(
                              onPressed: () => context
                                  .read<TodoBloc>()
                                  .add(RemoveTodo(state.todos[index])),
                              icon: const Icon(Icons.delete))
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Text("Error!");
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => openDialog(context)),
        ],
      ),
    );
  }

  void openDialog(BuildContext context) {
    TextEditingController newTaskTitleCon = TextEditingController();
    TextEditingController newTaskMessageCon = TextEditingController();

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Add new Task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: newTaskTitleCon,
                decoration: const InputDecoration(
                  hintText: "Title...",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: newTaskMessageCon,
                decoration: const InputDecoration(
                  hintText: "Message...",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                context.read<TodoBloc>().add(AddTodo(Todo(
                    title: newTaskTitleCon.text,
                    message: newTaskMessageCon.text)));

                Navigator.pop(context);
                newTaskTitleCon.text = "";
                newTaskMessageCon.text = "";
              },
              child: const Text("Add New Task"),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
                newTaskTitleCon.text = "";
                newTaskMessageCon.text = "";
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
