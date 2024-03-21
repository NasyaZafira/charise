import 'package:charise/purchase_order.dart';
import 'package:flutter/material.dart';

import 'neu_container.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final bgColor = Color(0xFFE7ECEF);
    // TODO: implement build
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return Purchase();
            }));
          },
          child: NeuContainer(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            borderRadius: BorderRadius.circular(40),
            child: Container(
              width: 70,
              child: Text(
                'Order',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
