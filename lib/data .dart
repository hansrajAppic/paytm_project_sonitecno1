import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<IconData> icons = [
    Icons.account_balance,
    Icons.attach_money,
    Icons.credit_card,
    Icons.account_balance_wallet,
    Icons.monetization_on,
    Icons.payment,
    Icons.receipt,
    Icons.account_balance,
    Icons.attach_money,
    Icons.credit_card,
    Icons.account_balance_wallet,
    Icons.monetization_on,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icon List Example'),
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 190, 222, 245), Color(0xffd4e1e7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
            itemCount: icons.length,
            itemBuilder: (BuildContext context, int index) {
              return Icon(icons[index], size: 48);
            },
          ),
        ),
      ),
    );
  }
}
