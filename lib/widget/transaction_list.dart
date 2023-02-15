import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransac;

  TransactionList(this.transactions, this.deleteTransac) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet ',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
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
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '${transactions[index].amount.toStringAsFixed(2)} €',
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            DateFormat('dd-MM-yyyy')
                                .format(transactions[index].date),
                            style: TextStyle(color: Colors.blueGrey),
                          )
                        ],
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: InkWell(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.delete),
                          ),
                          onTap: () {
                            deleteTransac(transactions[index].id);
                          },
                          onLongPress: () {
                            return Container(child: Text('Suprression'),
                            )
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
