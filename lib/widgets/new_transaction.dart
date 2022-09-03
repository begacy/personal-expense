import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addtransact;
  NewTransaction(this.addtransact);

  final amnt = TextEditingController();
  final name = TextEditingController();

  void submit_transaction() {
    final title = name.text;
    final price = double.parse(amnt.text);

    if (title.isEmpty || price <= 0) {
      return;
    }

    addtransact(title, price);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: name,
              onSubmitted: (_) => submit_transaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amnt,
              onSubmitted: (_) => submit_transaction(),
            ),
            TextButton(
                onPressed: submit_transaction, child: Text('Add Transaction'))
          ],
        ),
      ),
    );
  }
}
