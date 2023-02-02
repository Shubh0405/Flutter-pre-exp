import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/widgets/chart_bar.dart';
import '/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> userTransaction;

  const Chart({super.key, required this.userTransaction});

  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var i = 0; i < userTransaction.length; i++) {
        if (userTransaction[i].date.day == weekDay.day &&
            userTransaction[i].date.month == weekDay.month &&
            userTransaction[i].date.year == weekDay.year) {
          totalSum += userTransaction[i].amount;
        }
      }

      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum
      };
    });
  }

  double get totalSpending {
    double totalSum = 0.0;

    totalSum = groupedTransactionValue.fold(0.0, (sum, data) {
      return sum + (data["amount"] as double);
    });

    return (totalSum == 0.0 ? 0 : totalSum);
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValue);

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactionValue.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
                label: (data["day"] as String),
                spendingAmount: (data["amount"] as double),
                spendingAmountPct: (data["amount"] as double) / totalSpending),
          );
        }).toList(),
      ),
    );
  }
}
