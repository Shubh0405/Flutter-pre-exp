import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;

  const TransactionList({super.key, required this.userTransaction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: userTransaction.map((tx) {
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
                      '\$${tx.amount.toStringAsFixed(2)}')),
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
    );
  }
}
