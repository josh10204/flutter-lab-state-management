import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab_state_management/bloc/todo_bloc.dart';

import 'bloc_todolist_page.dart';

class BlocMain extends StatefulWidget {
  const BlocMain({super.key});

  @override
  State<BlocMain> createState() => _BlocMainState();
}

class _BlocMainState extends State<BlocMain> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<TodoBloc>(create: (BuildContext context) => TodoBloc())],
      child: const BlocTodoListPage(),
    );
  }
}
