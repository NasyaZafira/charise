import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dialog.dart';
import 'neu_button.dart';
import 'neu_container.dart';
import 'purchase_summary.dart';

class Purchase extends StatefulWidget {
  @override
  State<Purchase> createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  final List<Widget> itemList = List.generate(
    100,
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

    Widget barApp() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 25),
            child: NeuButton(
              child: Icon(Icons.keyboard_backspace_sharp),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              borderRadius: BorderRadius.circular(30),
              onPressed: () {},
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "Item Order",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          Container(
            margin: EdgeInsets.only(top: 20, right: 25),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => PlaceholderDialog(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.teal,
                      size: 80.0,
                    ),
                    title: 'Testing Dialog',
                    message: 'Asline ini isinya textfield\nHiraukan aja',
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: Text('!Got It'),
                      ),
                    ],
                  ),
                );
              },
              child: NeuButton(
                child: Icon(Icons.search_sharp),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                borderRadius: BorderRadius.circular(30),
                onPressed: () {},
              ),
            ),
          ),
        ],
      );
    }

    // TODO: implement build
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                barApp(),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: itemList,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[100],
        child: Icon(
          Icons.shopping_basket_sharp,
          color: Colors.black87,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PurchaseSummary(
                itemList: itemList,
              ),
            ),
          );
        },
      ),
    );
  }
}
