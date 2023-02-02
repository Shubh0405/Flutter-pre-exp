// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'widgets/transaction_list.dart';
import 'models/transaction.dart';
import 'widgets/new_transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Amaranth',
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'Amaranth',
                  fontWeight: FontWeight.bold,
                  fontSize: 23))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    // Transaction(
    //     id: "t1", title: "Recharge", amount: 599.0, date: DateTime.now()),
    // Transaction(id: "t2", title: "Netflix", amount: 999.9, date: DateTime.now())
  ];

  void _addTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransation(addTx: _addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Personal Expenses",
        ),
      ),
      body: SingleChildScrollView(
        child: _userTransaction.isEmpty
            ? Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "No Transactions found!",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset("assets/images/image1.png")
                  ],
                ),
              )
            : Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: 10.0,
                      color: Colors.red,
                      child: const Center(child: Text("Welcome back!"))),
                  TransactionList(userTransaction: _userTransaction)
                ],
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => startAddNewTransaction(context)),
    );
  }
}
