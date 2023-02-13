import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  const NewTransaction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountcontroller = TextEditingController();

    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountcontroller,
            ),
            ElevatedButton(
              onPressed: () {
                print(titleController.text);
              },
              child: Text('Add transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
