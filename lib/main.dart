import 'package:flutter/material.dart';

import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'new Clothes', amount: 62.23, date: DateTime.now()),
    Transaction(id: 't2', title: 'Shoes', amount: 112.70, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),

      // Column will always takes the size of its wider child
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Card will always takes the size of her parent

          Container(
            width: double.infinity,
            child: Card(
              color: Colors.indigo,
              elevation: 5,
              child: Text('ChART'),
            ),
          ),
          //(id: transaction.id, title: transaction.title, amount: transaction.amount, date: transaction.date),
          Column(
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
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 25),
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
                          transaction.date.toString(),
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
          )
        ],
      ),
    );
  }
}
