import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import '../models/currency.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required Currency currency,
    @required Transaction transaction,
    @required Function deleteTransaction,
  })  : _currency = currency,
        _transaction = transaction,
        _deleteTransaction = deleteTransaction,
        super(key: key);

  final Currency _currency;
  final Transaction _transaction;
  final Function _deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                  '${_currency.left()}${_transaction.amount}${_currency.right()}',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        title:
            Text(_transaction.title, style: Theme.of(context).textTheme.title),
        subtitle: Text(
          DateFormat.yMMMd().format(_transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                onPressed: () => _deleteTransaction(_transaction.id),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _deleteTransaction(_transaction.id);
                },
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
