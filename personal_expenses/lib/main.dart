import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "Recharge", amount: 599.0, date: DateTime.now()),
    Transaction(id: "t2", title: "Netflix", amount: 999.9, date: DateTime.now())
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Expenses"),
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: 10.0,
              color: Colors.red,
              child: const Center(child: Text("Welcome back!"))),
          Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
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
                        onPressed: (() {}),
                        child: const Text(
                          'Add Transaction',
                          style: TextStyle(color: Colors.purple),
                        )),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 2)),
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                            style: const TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            '\$${tx.amount.toString()}')),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(
                            tx.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Text(DateFormat.yMEd().add_jms().format(tx.date),
                            style: const TextStyle(color: Colors.grey))
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
