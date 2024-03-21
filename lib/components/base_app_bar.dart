import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../neu_button.dart';

class BaseAppBar extends StatelessWidget {
  final String title;
  final Function onBackPressed;

  const BaseAppBar(
      {super.key, required this.title, required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, left: 25),
          child: NeuButton(
            child: Icon(Icons.keyboard_backspace_sharp),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            borderRadius: BorderRadius.circular(30),
            onPressed: () {
              onBackPressed();
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, right: 25),
        ),
      ],
    );
  }
}
