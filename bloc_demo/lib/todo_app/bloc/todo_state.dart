part of 'todo_bloc.dart';

enum TodoStatus { initial, loading, success, error }

class TodoState extends Equatable {
  final List<Todo> todos;
  final TodoStatus todoStatus;

  const TodoState({
    this.todos = const <Todo>[],
    this.todoStatus = TodoStatus.initial,
  });

  TodoState copyWith({
    List<Todo>? todos,
    TodoStatus? todoStatus,
  }) {
    return TodoState(
        todos: todos ?? this.todos, todoStatus: todoStatus ?? this.todoStatus);
  }

  @override
  factory TodoState.fromJson(Map<String, dynamic> json) {
    try {
      var listOfTodos = (json["todo"] as List<dynamic>)
          .map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList();

      return TodoState(
          todos: listOfTodos,
          todoStatus: TodoStatus.values.firstWhere(
              (element) => element.name.toString() == json["status"]));
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "todo": todos,
      "status": todoStatus.name,
    };
  }

  @override
  List<Object> get props => [todos, todoStatus];
}
