import 'package:flutter/material.dart';

import 'income_expenses.dart';

class Income {
  String name;
  String sales;
  String remarks;
  String title;
  String date;

  Income({
    required this.name,
    required this.sales,
    required this.title,
    required this.date,
    required this.remarks,
  });
}

class IncomePage extends StatefulWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  IncomePageState createState() => IncomePageState();
}

class IncomePageState extends State<IncomePage> {
  final List<Income> incomeList = [];
  final TextEditingController incomeNameController = TextEditingController();
  final TextEditingController salesController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  void addIncome() {
    final String name = incomeNameController.text;
    final String sales = salesController.text;

    final String title = titleController.text;
    final String date = dateController.text;
    final String remarks = remarksController.text;

    if (name.isNotEmpty) {
      final Income newIncome = Income(
        name: name,
        sales: sales,
        title: title,
        date: date,
        remarks: remarks,
      );
      incomeList.add(newIncome);
      incomeNameController.clear();
      salesController.clear();

      titleController.clear();
      dateController.clear();
      _showIncomeDetailsPage();
      remarksController.clear();
    }
  }

  void _showIncomeDetailsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NextPage(
          incomeList: incomeList,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Income Tracker'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildIncomeInput(),
          ],
        ),
      ),
    );
  }

  Widget buildIncomeInput() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: incomeNameController,
              decoration: const InputDecoration(labelText: 'Income Name'),
            ),
            TextField(
              controller: salesController,
              decoration: const InputDecoration(labelText: 'Sales'),
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title (Receipt)'),
            ),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(labelText: 'Date (Receipt)'),
            ),
            TextField(
              controller: remarksController,
              decoration: const InputDecoration(labelText: 'Remarks'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addIncome,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}


