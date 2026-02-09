import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab_state_management/bloc/todo_bloc.dart';

class BlocTodoListPage extends StatefulWidget {
  const BlocTodoListPage({super.key});

  @override
  State<BlocTodoListPage> createState() => _BlocTodoListPageState();
}

class _BlocTodoListPageState extends State<BlocTodoListPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<TodoBloc>(create: (BuildContext context) => TodoBloc())],
      child: Scaffold(
        appBar: AppBar(title: const Text('BLoC TodoList')),
        body: Column(children: [_filterChoiceChipList(context), _todoListView()]),
        floatingActionButton: _addTodoButton(context),
      ),
    );
  }

  Widget _filterChoiceChipList(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _filterChoiceChip(context, 'all', '全部', state.filter),
              _filterChoiceChip(context, 'active', '未完成', state.filter),
              _filterChoiceChip(context, 'completed', '已完成', state.filter),
            ],
          ),
        );
      },
    );
  }

  Widget _filterChoiceChip(BuildContext context, String value, String label, String current) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(label),
        selected: current == value,
        onSelected: (_) {
          context.read<TodoBloc>().add(SetFilterEvent(value));
        },
      ),
    );
  }

  Widget _todoListView() {
    return Expanded(
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.filteredTodos.isEmpty) {
            return const Center(child: Text('無待辦事項'));
          }
          return ListView.builder(
            itemCount: state.filteredTodos.length,
            itemBuilder: (context, index) {
              final todo = state.filteredTodos[index];
              return ListTile(
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (_) {
                    context.read<TodoBloc>().add(ToggleTodoEvent(todo.id));
                  },
                ),
                title: Text(todo.title, style: TextStyle(decoration: todo.isCompleted ? TextDecoration.lineThrough : null)),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    context.read<TodoBloc>().add(DeleteTodoEvent(todo.id));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _addTodoButton(BuildContext context) {
    return FloatingActionButton(onPressed: () => _showAddDialog(context), child: const Icon(Icons.add));
  }

  void _showAddDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('新增待辦事項'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: '輸入待辦事項'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('取消')),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                context.read<TodoBloc>().add(AddTodoEvent(controller.text));
                Navigator.pop(dialogContext);
              }
            },
            child: const Text('新增'),
          ),
        ],
      ),
    );
  }
}
