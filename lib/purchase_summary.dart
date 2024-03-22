import 'package:charise/components/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'payment_summary.dart';

class PurchaseSummary extends StatefulWidget {
  final List<Map<String, dynamic>> itemProduct;
  const PurchaseSummary({Key? key, required this.itemProduct}) : super(key: key);

  @override
  State<PurchaseSummary> createState() => _PurchaseSummaryState();
}

class _PurchaseSummaryState extends State<PurchaseSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7ECEF),
      body: SafeArea(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                BaseAppBar(
                  title: "Purchase Summary",
                  onBackPressed: () {
                    Navigator.pop(context);
                  },
                ),
                // ListView.builder(
                //   itemCount: itemProduct.length,
                //   itemBuilder: (context, index) => [] ,
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   children: widget.itemProduct,
                // ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[100],
        child: const Icon(
          Icons.payments,
          color: Colors.black87,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentSummary()),
          );
        },
      ),
    );
  }
}
