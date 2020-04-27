import '../models/transaction.dart';
import '../models/currency.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Currency _currency;
  final Function _deleteTransaction;

  TransactionList(this._transactions, this._currency, this._deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Container(
                    height: constraints.maxHeight * 0.15,
                    child: Text('No transactions added yet!',
                        style: Theme.of(context).textTheme.title),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.15,
                  ),
                  Container(
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                    height: constraints.maxHeight * 0.7,
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: _transactions.length,
            itemBuilder: (ctx, index) {
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
                            '${_currency.left()}${_transactions[index].amount}${_currency.right()}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  title: Text(_transactions[index].title,
                      style: Theme.of(context).textTheme.title),
                  subtitle: Text(
                    DateFormat.yMMMd().format(_transactions[index].date),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteTransaction(_transactions[index].id);
                    },
                    color: Theme.of(context).errorColor,
                  ),
                ),
              );
            },
          );
  }
}
