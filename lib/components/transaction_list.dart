import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  //const TransactionList({Key? key}) : super(key: key);
  final List<Transaction> _transactions;

  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'Nenhuma Transacao Lozalizada',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 20),
                Container(
                  height: 250,
                  child: Image.asset(
                    'Assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (context, index) {
                final e = _transactions[index];
                return Card(
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.purple, width: 2)),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'R\$  ${e.value.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple,
                            ),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat('d MMM y').format(e.date),
                            style: TextStyle(color: Colors.grey),
                          )
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
