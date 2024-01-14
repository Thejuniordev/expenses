import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  const TransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Nova transação'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
