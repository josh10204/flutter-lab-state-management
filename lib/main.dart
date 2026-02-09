import 'package:flutter/material.dart';
import 'package:flutter_lab_state_management/riverpod/change_notifier/change_notifier_page.dart';
import 'package:flutter_lab_state_management/riverpod/future_provider/future_provider_page.dart';
import 'package:flutter_lab_state_management/riverpod/state_notifier/state_notifier_page.dart';
import 'package:flutter_lab_state_management/riverpod/state_provider/state_provider_page.dart';

import 'bloc/bloc_todolist_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '狀態管理',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Color.fromRGBO(0, 200, 220, 1))),
      home: const HomePage(title: '狀態管理'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(title)),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            _listItem(context: context, title: 'BloC', subTitle: 'TodoList', routePage: const BlocTodoListPage()),
            _listItem(context: context, title: 'StateProvider', subTitle: 'TodoList', routePage: const StateProviderPage()),
            _listItem(context: context, title: 'StateNotifier', subTitle: 'TodoList', routePage: const StateNotifierPage()),
            _listItem(context: context, title: 'FutureProvider', subTitle: 'TodoList', routePage: const FutureProviderPage()),
            _listItem(context: context, title: 'ChangeNotifier', subTitle: 'TodoList', routePage: const ChangeNotifierPage()),
          ],
        ),
      ),
    );
  }

  Widget _listItem({required BuildContext context, required String title, required String subTitle, required Widget routePage}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.white,
      shadowColor: Colors.grey,
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subTitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => routePage));
        },
      ),
    );
  }
}
