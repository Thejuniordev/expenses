import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Final de ano com a familia',
        value: 4345.54,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Conta de luz de casa',
        value: 257.44,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Despesas pessoais'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: const Card(
                color: Colors.blueAccent,
                child: Text('Gráfico'),
              ),
            ),
            Column(
              children: _transactions.map((transaction) {
                return Card(
                  child: Text(transaction.title),
                );
              }).toList(),
            )
          ],
        ));
  }
}
