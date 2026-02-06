import 'package:flutter/material.dart';

class StateNotifierPage extends StatefulWidget {
  const StateNotifierPage({super.key});

  @override
  State<StateNotifierPage> createState() => _StateNotifierPageState();
}

class _StateNotifierPageState extends State<StateNotifierPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StateNotifierPage')),
      body: Container(),
    );
  }
}
