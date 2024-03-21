import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../neu_container.dart';

class SummaryItem extends StatelessWidget {
  final int index;

  SummaryItem({required this.index});
  
  @override
  Widget build(BuildContext context) {
    return NeuContainer(
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
    );
  }
}
