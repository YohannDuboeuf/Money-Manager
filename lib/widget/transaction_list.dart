import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({Key key}) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _userTransactions = [
    Transaction('t1', "Nouvelle chaussure", DateTime.now(), 59.98),
    Transaction('t2', "Macdo", DateTime.now(), 17.98)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTransactions.map((transac) {
        return Card(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 28, 155, 194),
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  '${transac.amount} €',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 28, 155, 194)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transac.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy').format(transac.date),
                    style: TextStyle(color: Colors.blueGrey),
                  )
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
