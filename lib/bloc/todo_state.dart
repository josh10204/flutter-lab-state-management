part of 'todo_bloc.dart';

class TodoState {
  final List<Todo> todos;
  final String filter;

  TodoState({this.todos = const [], this.filter = 'all'});

  TodoState copyWith({List<Todo>? todos, String? filter}) {
    return TodoState(todos: todos ?? this.todos, filter: filter ?? this.filter);
  }

  List<Todo> get filteredTodos {
    switch (filter) {
      case 'completed':
        return todos.where((t) => t.isCompleted).toList();
      case 'active':
        return todos.where((t) => !t.isCompleted).toList();
      default:
        return todos;
    }
  }
}
