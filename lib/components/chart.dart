import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({super.key, required this.recentTransactions});

  List<Map<String, Object>> get groupTransactions {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );

      final day = DateFormat.E().format(weekday)[0];

      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameDay = recentTransactions[i].date.day == weekday.day;
        bool sameMonth = recentTransactions[i].date.month == weekday.month;
        bool sameYear = recentTransactions[i].date.year == weekday.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransactions[i].value;
        }
      }

      return {
        'day': day,
        'value': totalSum,
      };
    });
  }

  double get _weekTotalValue {
    return groupTransactions.fold(0.0, (previousValue, transaction) {
      return previousValue + (transaction['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: groupTransactions.map((transaction) {
          return ChartBar(
            label: transaction['day'],
            value: transaction['value'],
            percentage: (transaction['value'] as double) / _weekTotalValue,
          );
          // return Text('${transaction['day']}: ${transaction['value']}');
        }).toList(),
      ),
    );
  }
}
