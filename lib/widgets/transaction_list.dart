import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((transaction) {
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
