import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'new Clothes', amount: 62.23, date: DateTime.now()),
    Transaction(id: 't2', title: 'Shoes', amount: 112.70, date: DateTime.now()),
  ];

  void _addNewTransaction(String titleTx, double amountTx) {
    final Transaction newtransaction = Transaction(
        title: titleTx,
        amount: amountTx,
        id: DateTime.now().toString(),
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newtransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
