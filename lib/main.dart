import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widget/new_transaction.dart';
import 'models/transaction.dart';
import './widget/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String titleInput;
  String amountInput;

  final titleController = TextEditingController();
  final amountcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Manager'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Container(
                child: Text('CHART'),
              ),
              elevation: 20,
            ),
          ),
          NewTransaction(),
          TransactionList(),
        ],
      ),
    );
  }
}
