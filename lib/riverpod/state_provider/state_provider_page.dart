import 'package:flutter/material.dart';

class StateProviderPage extends StatefulWidget {
  const StateProviderPage({super.key});

  @override
  State<StateProviderPage> createState() => _StateProviderPageState();
}

class _StateProviderPageState extends State<StateProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StateProviderPage')),
      body: Container(),
    );
  }
}
