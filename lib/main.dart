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
          Card(
            child: Text('List of Transactions'),
          )
        ],
      ),
    );
  }
}
