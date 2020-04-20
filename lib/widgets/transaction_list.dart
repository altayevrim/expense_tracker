import '../models/transaction.dart';
import '../models/currency.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Currency _currency;

  TransactionList(this._transactions, this._currency);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _transactions.isEmpty
        ? Column(
        children: <Widget>[
          Text('No transactions added yet!',
              style: Theme.of(context).textTheme.title),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
            height: 200,
          ),
        ],
      )
    : ListView.builder(
        itemCount: _transactions.length,
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  )),
                  child: Text(
                    '${_currency.left()}${_transactions[index].amount.toStringAsFixed(2)}${_currency.right()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _transactions[index].title,
                      // style: TextStyle(
                      //   fontWeight: FontWeight.bold,
                      //   fontSize: 16,
                      // ),
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text(
                      DateFormat.yMMMd()
                          .format(_transactions[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ), 
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
