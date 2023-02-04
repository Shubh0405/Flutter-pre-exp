import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransation extends StatefulWidget {
  final Function addTx;

  const NewTransation({super.key, required this.addTx});

  @override
  State<NewTransation> createState() => _NewTransationState();
}

class _NewTransationState extends State<NewTransation> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  late DateTime _selectedDate;
  bool DateSelected = false;

  void submitButton() {
    String title = titleController.text;

    if (title.isEmpty || amountController.text.isEmpty || !DateSelected) {
      return;
    }

    double amount = double.parse(amountController.text);

    if (amount <= 0) {
      return;
    }

    widget.addTx(title, amount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _openDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }

      print(' Before value :  ${value}');

      setState(() {
        _selectedDate = value;
        DateSelected = true;
        print('set state value : ${_selectedDate}');
        print(DateSelected);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(!DateSelected
                      ? 'No Date Selected!'
                      : 'Date selected: ${DateFormat.yMd().format(_selectedDate)}'),
                  TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(12)),
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromARGB(255, 232, 188, 240)),
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white)),
                      onPressed: _openDatePicker,
                      child: const Text(
                        'Choose Date',
                        style: TextStyle(
                            color: Colors.purple, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextButton(
                  style: Theme.of(context).textButtonTheme.style,
                  onPressed: submitButton,
                  child: const Text(
                    'Add Transaction',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
