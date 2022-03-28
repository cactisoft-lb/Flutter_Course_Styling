import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'presonal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Opensans',
                fontSize: 18,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Opensans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'presonal Expenses',
          style: TextStyle(fontFamily: 'Opensans'),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(
                Icons.add,
                color: Colors.white,
              )),
        ],
      ),

      // Column will always takes the size of its wider child
      body: SingleChildScrollView(
        child: Column(
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
            TransactionList(_userTransactions),
            //UserTransaction(),
            //(id: transaction.id, title: transaction.title, amount: transaction.amount, date: transaction.date),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
