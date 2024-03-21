import 'package:flutter/material.dart';

import 'neu_button.dart';
import 'neu_container.dart';

class Purchase extends StatefulWidget {
  @override
  State<Purchase> createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  final List<Widget> itemList = List.generate(
    10,
    (index) => NeuContainer(
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15)),
            child: Icon(Icons.menu),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            index.toString(),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      borderRadius: BorderRadius.circular(15),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final bgColor = Color(0xFFE7ECEF);

    // TODO: implement build
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
          child:
          ListView(
            children: itemList,
          ),

      ),
    );
  }
}
