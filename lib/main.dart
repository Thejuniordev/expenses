import 'package:flutter/material.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Despesas pessoais'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: const Card(
                color: Colors.blueAccent,
                child: Text('Gráfico'),
              ),
            ),
            const Card(
              child: Text('Lista de transações'),
            )
          ],
        ));
  }
}
