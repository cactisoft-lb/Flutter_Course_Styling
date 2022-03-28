import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Styling Container => adding some styling properties
                Container(
                  child: Text(
                    "\$${transactions[index].amount.toStringAsFixed(2)}",
                    //text Styling properties
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  padding: EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Theme.of(context).primaryColor),
                  ),
                ),
                //styling the body of the Card
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      //using itl DateFormat
                      DateFormat.yMMMd().format(transactions[index].date),
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
        },
        itemCount: transactions
            .length, // now flutter knows taht he will call the itemBuilder many times
        // children: transactions.map((transaction) {

        // }).toList(),
      ),
    );
  }
}
