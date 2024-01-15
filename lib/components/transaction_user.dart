import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Final de ano com a familia',
        value: 945.50,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Conta de luz de casa',
        value: 257.44,
        date: DateTime.now()),
    Transaction(
        id: 't3',
        title: 'Conta de luz de casa',
        value: 257.44,
        date: DateTime.now()),
    Transaction(
        id: 't4',
        title: 'Conta de luz de casa',
        value: 257.44,
        date: DateTime.now()),
    Transaction(
        id: 't6',
        title: 'Conta de luz de casa',
        value: 257.44,
        date: DateTime.now()),
    Transaction(
        id: 't7',
        title: 'Conta de luz de casa',
        value: 257.44,
        date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(onSubmit: _addTransaction),
        TransactionList(transactions: _transactions),
      ],
    );
  }
}
