import 'package:flutter/material.dart';

class BlocTodoListPage extends StatefulWidget {
  const BlocTodoListPage({super.key});

  @override
  State<BlocTodoListPage> createState() => _BlocTodoListPageState();
}

class _BlocTodoListPageState extends State<BlocTodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC Pattern')),
      body: Container(),
    );
  }
}
