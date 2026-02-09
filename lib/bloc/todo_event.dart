part of 'todo_bloc.dart';

abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final String title;
  AddTodoEvent(this.title);
}

class ToggleTodoEvent extends TodoEvent {
  final String id;
  ToggleTodoEvent(this.id);
}

class DeleteTodoEvent extends TodoEvent {
  final String id;
  DeleteTodoEvent(this.id);
}

class SetFilterEvent extends TodoEvent {
  final String filter;
  SetFilterEvent(this.filter);
}
