import '../models/transaction.dart';
import '../models/currency.dart';
import './transaction_item.dart';
import 'package:flutter/material.dart';

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
              return TransactionItem(
                  currency: _currency,
                  transaction: _transactions[index],
                  deleteTransaction: _deleteTransaction);
            },
          );
  }
}
