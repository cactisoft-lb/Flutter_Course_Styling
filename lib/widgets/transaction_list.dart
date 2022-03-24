import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  State createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'new Clothes', amount: 62.23, date: DateTime.now()),
    Transaction(id: 't2', title: 'Shoes', amount: 112.70, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTransactions.map((transaction) {
        return Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Styling Container => adding some styling properties
              Container(
                child: Text(
                  "\$${transaction.amount}",
                  //text Styling properties
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                padding: EdgeInsets.all(11),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.purple),
                ),
              ),
              //styling the body of the Card
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transaction.title,
                    style: TextStyle(
                        color: Colors.purple[400],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    //using itl DateFormat
                    DateFormat.yMMMd().format(transaction.date),
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
