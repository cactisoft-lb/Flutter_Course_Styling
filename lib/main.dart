import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            color: Colors.indigo,
            elevation: 5,
            // a Card always takes the width of its child
            child: Container(
              width: double.infinity,
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
