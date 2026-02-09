import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab_state_management/models/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState()) {
    on<AddTodoEvent>(_onAddTodo);
    on<ToggleTodoEvent>(_onToggleTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
    on<SetFilterEvent>(_onSetFilter);
  }

  void _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) {
    final newTodo = Todo(id: DateTime.now().toString(), title: event.title);
    emit(state.copyWith(todos: [...state.todos, newTodo]));
  }

  void _onToggleTodo(ToggleTodoEvent event, Emitter<TodoState> emit) {
    final updatedTodos = state.todos.map((todo) {
      if (todo.id == event.id) {
        return todo.copyWith(isCompleted: !todo.isCompleted);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: updatedTodos));
  }

  void _onDeleteTodo(DeleteTodoEvent event, Emitter<TodoState> emit) {
    emit(state.copyWith(todos: state.todos.where((t) => t.id != event.id).toList()));
  }

  void _onSetFilter(SetFilterEvent event, Emitter<TodoState> emit) {
    emit(state.copyWith(filter: event.filter));
  }
}
