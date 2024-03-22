import 'package:charise/components/second_container.dart';
import 'package:flutter/material.dart';

import 'components/base_app_bar.dart';
import 'components/order_item.dart';
import 'purchase_summary.dart';

class Purchase extends StatefulWidget {
  @override
  State<Purchase> createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  TextEditingController dialogController = TextEditingController(text: '');

  List<Map<String, dynamic>> itemProduct = [
    {"id": 0, "product": "mineral 100 ml", "price": 100, "qty": 0},
    {"id": 1, "product": "mineral 200 ml", "price": 200, "qty": 0},
    {"id": 2, "product": "mineral 300 ml", "price": 300, "qty": 0},
    {"id": 3, "product": "mineral 400 ml", "price": 400, "qty": 0},
    {"id": 4, "product": "mineral 500 ml", "price": 500, "qty": 0},
    {"id": 5, "product": "mineral 600 ml", "price": 600, "qty": 0},
    {"id": 6, "product": "mineral 700 ml", "price": 700, "qty": 0},
    {"id": 7, "product": "mineral 800 ml", "price": 800, "qty": 0},
    {"id": 8, "product": "mineral 900 ml", "price": 900, "qty": 0},
    {"id": 9, "product": "mineral 1000 ml", "price": 1000, "qty": 0},
    {"id": 10, "product": "mineral 1100 ml", "price": 1100, "qty": 0},
    {"id": 11, "product": "mineral 1200 ml", "price": 1200, "qty": 0}
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
    const bgColor = Color(0xFFE7ECEF);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SizedBox(
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  borderRadius: BorderRadius.circular(50),
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(13),
                        hintText: 'Search',
                        suffixIcon: Icon(Icons.search)),
                  ),
                ),
                ListView.builder(
                  itemCount: searchProduct.length,
                  itemBuilder: (context, index) {
                    int qty = searchProduct[index]["qty"];

                    return OrderItem(
                      data: searchProduct[index],
                      qty: qty,
                      onDecreasePressed: () {
                        setState(() {
                          searchProduct[index] = {
                            "id": searchProduct[index]["id"],
                            "product": searchProduct[index]["product"],
                            "price": searchProduct[index]["price"],
                            "qty": qty > 0 ? qty - 1 : qty
                          };
                        });
                      },
                      onIncreasePressed: () {
                        setState(() {
                          searchProduct[index] = {
                            "id": searchProduct[index]["id"],
                            "product": searchProduct[index]["product"],
                            "price": searchProduct[index]["price"],
                            "qty": qty + 1,
                          };
                        });
                      },
                    );
                  },
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
        child: const Icon(
          Icons.shopping_basket_sharp,
          color: Colors.black87,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PurchaseSummary(
                itemProduct: itemProduct.where((products) {
                  int qty = products["qty"];
                  return qty > 0;
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
