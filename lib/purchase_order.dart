import 'package:charise/components/second_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/base_app_bar.dart';
import 'components/dialog.dart';
import 'components/neu_button.dart';
import 'components/neu_container.dart';
import 'purchase_summary.dart';

class Purchase extends StatefulWidget {
  @override
  State<Purchase> createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  TextEditingController dialogController = TextEditingController(text: '');

  List<Map<String, dynamic>> itemProduct = [
    {"id": 0, "product": "mineral 100 ml", "price": 100},
    {"id": 1, "product": "mineral 200 ml", "price": 200},
    {"id": 2, "product": "mineral 300 ml", "price": 300},
    {"id": 3, "product": "mineral 400 ml", "price": 400},
    {"id": 4, "product": "mineral 500 ml", "price": 500},
    {"id": 5, "product": "mineral 600 ml", "price": 600},
    {"id": 6, "product": "mineral 700 ml", "price": 700},
    {"id": 7, "product": "mineral 800 ml", "price": 800},
    {"id": 8, "product": "mineral 900 ml", "price": 900},
    {"id": 9, "product": "mineral 1000 ml", "price": 1000},
    {"id": 10, "product": "mineral 1100 ml", "price": 1100},
    {"id": 11, "product": "mineral 1200 ml", "price": 1200}
  ];

  List<Map<String, dynamic>> searchProduct = [];

  @override
  void initState() {
    searchProduct = itemProduct;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = itemProduct;
    } else {
      results = itemProduct
          .where((products) => products["product"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      searchProduct = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = Color(0xFFE7ECEF);

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
                BaseAppBar(
                  title: "Purchase Order",
                  onBackPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SecondContainer(
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(13),
                        hintText: 'Search',
                        suffixIcon: Icon(Icons.search)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  borderRadius: BorderRadius.circular(50),
                ),
                ListView.builder(
                  itemCount: searchProduct.length,
                  itemBuilder: (context, index) => NeuContainer(
                    key: ValueKey(searchProduct[index]["id"]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(searchProduct[index]["id"].toString()),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          searchProduct[index]["product"],
                        ),
                        Text("Rp" + searchProduct[index]["price"].toString()),
                        Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  NeuButton(
                                      child: Icon(
                                          Icons.remove_circle_outline_sharp),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5,),
                                      borderRadius: BorderRadius.circular(50),
                                      onPressed: () {}),
                                  SecondContainer(
                                    child: Text('10', textAlign: TextAlign.center,),
                                    padding: EdgeInsets.symmetric(),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  NeuButton(
                                      child:
                                          Icon(Icons.add_circle_outline_sharp),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, ),
                                      borderRadius: BorderRadius.circular(50),
                                      onPressed: () {}),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
                itemProduct: itemProduct,
              ),
            ),
          );
        },
      ),
    );
  }
}
