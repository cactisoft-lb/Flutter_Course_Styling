import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import './widgets/transaction_list.dart';

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
  // final List<Transaction> transactions = [
  //   Transaction(
  //       id: 't1', title: 'new Clothes', amount: 62.23, date: DateTime.now()),
  //   Transaction(id: 't2', title: 'Shoes', amount: 112.70, date: DateTime.now()),
  // ];

  // we will use these properties to store input data firing by the onChange TextField
  // named property
  // String stringTitle;
  // String stringAmount;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
          //adding text field card
          Card(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Amount',
                    ),
                    controller: amountController,
                  ),
                  FlatButton(
                      child: Text(
                        'transaction',
                        style: TextStyle(
                          color: Colors.purple[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        debugPrint(titleController.text);
                        debugPrint(amountController.text);
                      }),
                ],
              ),
            ),
          ),
          TransactionList(),
          //(id: transaction.id, title: transaction.title, amount: transaction.amount, date: transaction.date),
        ],
      ),
    );
  }
}
