import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransac;

  NewTransaction(this.addTransac) {}

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountcontroller = TextEditingController();
  DateTime _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  void _submitdata() {
    final enteredTilte = titleController.text;
    final enteredAmount = double.parse(amountcontroller.text);

    if (enteredTilte.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTransac(enteredTilte, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            left: 10,
          ),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => _submitdata(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountcontroller,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitdata(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Text(_selectedDate == null
                        ? 'No date chosen'
                        : 'Date choisi: ${DateFormat('dd-MM-yyyy').format(_selectedDate)}'),
                    TextButton(
                      onPressed: () {
                        _presentDatePicker();
                      },
                      child: Text(
                        'Chose Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _submitdata();
                },
                child: Text('Add transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
