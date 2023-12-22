import 'package:flutter/material.dart';
import 'package:myapp/expensepage.dart';

import 'income.dart';

class NextPage extends StatelessWidget {
  final List<Income> incomeList;

  const NextPage({Key? key, required this.incomeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Income Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'Income Details on Next Page:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            buildIncomeList(),
          ],
        ),
      ),
    );
  }

  Widget buildIncomeList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: incomeList.length,
      itemBuilder: (context, index) {
        final income = incomeList[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(income.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Income Name: ${income.name}'),
                Text('Sales: ${income.sales}'),
                Text('Date: ${income.date}'),
                Text('Remarks: ${income.remarks}'),
              ],
            ),
          ),
        );
      },
    );
  }
}


class DetailsPage extends StatelessWidget {
  final double totalAmount;
  final List<Transaction> transactionList;

  const DetailsPage({
    Key? key,
    required this.totalAmount,
    required this.transactionList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Transaction Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            buildTransactionList(),
          ],
        ),
      ),
    );
  }

  Widget buildTransactionList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: transactionList.length,
      itemBuilder: (context, index) {
        final transaction = transactionList[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(transaction.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${transaction.name}'),
                Text('Category: ${transaction.category}'),
                Text('Date: ${transaction.date}'),
                Text('Remarks: ${transaction.remarks}'),
              ],
            ),
            trailing: Text('\$${transaction.amount.toStringAsFixed(2)}'),
          ),
        );
      },
    );
  }
}