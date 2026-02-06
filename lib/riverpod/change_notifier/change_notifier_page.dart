import 'package:flutter/material.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({super.key});

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ChangeNotifierPage')),
      body: Container(),
    );
  }
}
