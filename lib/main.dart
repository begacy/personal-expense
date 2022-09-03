import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  return runApp(const ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      home: Expense(),
    );
  }
}

class Expense extends StatefulWidget {
  Expense({Key? key}) : super(key: key);

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<Transact> _transact = [
    Transact(
      id: 't1',
      name: 'bek',
      amount: 10,
      date: DateTime.now(),
    ),
    Transact(
      id: 't2',
      name: 'fev',
      amount: 20,
      date: DateTime.now(),
    ),
  ];

  void _addtransaction(String namu, double amt) {
    final newtx = Transact(
      id: DateTime.now().toString(),
      name: namu,
      amount: amt,
      date: DateTime.now(),
    );

    setState(() {
      _transact.add(newtx);
    });
  }

  void shownewtransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addtransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
        actions: [
          IconButton(
              color: Colors.white,
              onPressed: () {
                shownewtransaction(context);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: const Card(
                elevation: 5,
                child: Text('chart'),
              ),
            ),
            TransactionList(_transact),
            // UserTransaction(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          shownewtransaction(context);
        },
      ),
    );
  }
}
