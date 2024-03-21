import 'package:flutter/material.dart';

import 'neu_container.dart';

class Purchase extends StatefulWidget {
  @override
  State<Purchase> createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {

  @override
  Widget build(BuildContext context) {
    final bgColor = Color(0xFFE7ECEF);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: GestureDetector(
          onTap: () {
          },
          child: NeuContainer(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            borderRadius: BorderRadius.circular(40),
            child: Container(
              width: 70,
              child: Text(
                'Purchase',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
