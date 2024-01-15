import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titlecontroller = TextEditingController();
  final valuecontroller = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm({super.key, required this.onSubmit});

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
                  onPressed: () {
                    final title = titlecontroller.text;
                    final value = double.tryParse(valuecontroller.text) ?? 0;
                    onSubmit(title, value);
                    print(titlecontroller.text);
                  },
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
