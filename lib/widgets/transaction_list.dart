import 'package:flutter/material.dart';

import "../models/transaction.dart";
import "./transaction_item.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constratins) {
            return Column(
              children: <Widget>[
                Text(
                  "No transactions added yet",
                  style: Theme.of(context).textTheme.title,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: constratins.maxHeight * 0.6,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(transaction: transactions[index], deleteTx: deleteTx);
            },
            itemCount: transactions.length,
          );
  }
}

