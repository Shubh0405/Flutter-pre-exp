import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;
  final Function deleteTx;

  const TransactionList(
      {super.key, required this.userTransaction, required this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: userTransaction.map((tx) {
        return Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2)),
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
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
              IconButton(
                onPressed: () => deleteTx(tx.id),
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
