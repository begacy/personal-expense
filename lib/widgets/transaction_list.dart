import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'user_transaction.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transact> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.black,
                        width: 3,
                      )),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '${transaction[index].amount.toStringAsFixed(2)} ETB',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(
                          transaction[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )),
                        Container(
                          child: Text(
                            DateFormat.yMMMMd().format(transaction[index].date),
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transaction.length,
      ),
    );
  }
}
