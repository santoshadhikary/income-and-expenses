import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'income_expenses.dart';

class Transaction {
  String name;
  double amount;
  String category;
  String title;
  String date;
  String remarks;

  Transaction({
    required this.name,
    required this.amount,
    required this.category,
    required this.title,
    required this.date,
    required this.remarks,
  });
}

class FinancePage extends StatefulWidget {
  const FinancePage({Key? key}) : super(key: key);

  @override
  FinancePageState createState() => FinancePageState();
}

class FinancePageState extends State<FinancePage> {
  final List<Transaction> transactionsList = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  void addTransaction() {
    final String name = nameController.text;
    final double amount = double.tryParse(amountController.text) ?? 0.0;
    final String category = categoryController.text;
    final String title = titleController.text;
    final String date = dateController.text;
    final String remarks = remarksController.text;

    if (name.isNotEmpty && amount > 0) {
      final Transaction newTransaction = Transaction(
        name: name,
        amount: amount,
        category: category,
        title: title,
        date: date,
        remarks: remarks,
      );
      transactionsList.add(newTransaction);
      nameController.clear();
      amountController.clear();
      categoryController.clear();
      titleController.clear();
      dateController.clear();
      remarksController.clear();
      _showDetailsPage(transactionsList, calculateTotal(transactionsList));
    }
  }

  void _showDetailsPage(List<Transaction> itemList, double total) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          totalAmount: total,
          transactionList: itemList,
        ),
      ),
    );
  }

  double calculateTotal(List<Transaction> itemList) {
    return itemList.fold(0, (prev, item) => prev + item.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance Tracker'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildInputFields(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addTransaction,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputFields() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title (Payment)'),
            ),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(labelText: 'Date (Payment)'),
            ),
            TextField(
              controller: remarksController,
              decoration: const InputDecoration(labelText: 'Remarks'),
            ),
          ],
        ),
      ),
    );
  }
}
