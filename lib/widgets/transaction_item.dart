import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import "../models/transaction.dart";

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function deleteTx;

  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
                child: Text("\$${transaction[index].amount}")),
          ),
        ),
        title: Text(
          transaction[index].title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction[index].date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction[index].id),
                icon: const Icon(Icons.delete),
                label: const Text("Delete"),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction[index].id),
              ),
      ),
    );
  }
}