import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titlecontroller = TextEditingController();

  final valuecontroller = TextEditingController();

  _submitForm() {
    final title = titlecontroller.text;
    final value = double.tryParse(valuecontroller.text) ?? 0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titlecontroller,
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              controller: valuecontroller,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Text('Nenhuma data selecionada'),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Selecionar data'),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _submitForm();
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
