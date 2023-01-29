import 'package:flutter/material.dart';

class NewTransation extends StatelessWidget {
  final Function addTx;

  const NewTransation({super.key, required this.addTx});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    void submitButton() {
      String title = titleController.text;

      if (title.isEmpty || amountController.text.isEmpty) {
        return;
      }

      double amount = double.parse(amountController.text);

      if (amount <= 0) {
        return;
      }

      addTx(title, amount);

      Navigator.of(context).pop();
    }

    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitButton(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitButton(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(12)),
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Color.fromARGB(255, 241, 208, 247)),
                  ),
                  onPressed: submitButton,
                  child: const Text(
                    'Add Transaction',
                    style: TextStyle(color: Colors.purple),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
