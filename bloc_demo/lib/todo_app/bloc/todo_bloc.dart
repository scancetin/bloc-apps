import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../models/todo_model.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends HydratedBloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<TodoStart>(_onStarted);
    on<AddTodo>(_onAddTodo);
    on<RemoveTodo>(_onRemoveTodo);
    on<UpdateTodo>(_onUpdateTodo);
  }

  void _onStarted(TodoStart event, Emitter<TodoState> emit) {
    if (state.todoStatus == TodoStatus.success) return;
    emit(state.copyWith(todos: state.todos, todoStatus: TodoStatus.success));
  }

  void _onAddTodo(AddTodo event, Emitter<TodoState> emit) {
    emit(state.copyWith(todoStatus: TodoStatus.loading));
    try {
      List<Todo> temp = [];
      temp.addAll(state.todos);
      temp.insert(0, event.todo);
      emit(state.copyWith(todos: temp, todoStatus: TodoStatus.success));
    } catch (e) {
      emit(state.copyWith(todoStatus: TodoStatus.error));
    }
  }

  void _onRemoveTodo(RemoveTodo event, Emitter<TodoState> emit) {
    emit(state.copyWith(todoStatus: TodoStatus.loading));
    try {
      state.todos.remove(event.todo);
      emit(state.copyWith(todos: state.todos, todoStatus: TodoStatus.success));
    } catch (e) {
      emit(state.copyWith(todoStatus: TodoStatus.error));
    }
  }

  void _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) {
    emit(state.copyWith(todoStatus: TodoStatus.loading));
    try {
      state.todos[event.index].isDone = !state.todos[event.index].isDone;
      emit(state.copyWith(todos: state.todos, todoStatus: TodoStatus.success));
    } catch (e) {
      emit(state.copyWith(todoStatus: TodoStatus.error));
    }
  }

  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    return TodoState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoState state) {
    return state.toJson();
  }
}
