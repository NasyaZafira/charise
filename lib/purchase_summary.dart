import 'package:charise/components/base_app_bar.dart';
import 'package:charise/components/summary_item.dart';
import 'package:flutter/material.dart';

import 'payment_summary.dart';

class PurchaseSummary extends StatefulWidget {
  final List<Map<String, dynamic>> itemProduct;

  const PurchaseSummary({super.key, required this.itemProduct});

  @override
  State<PurchaseSummary> createState() => _PurchaseSummaryState();
}

class _PurchaseSummaryState extends State<PurchaseSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7ECEF),
      body: SafeArea(
        child: SizedBox(
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
                ListView.builder(
                  itemCount: widget.itemProduct.length,
                  itemBuilder: (context, index) => SummaryItem(
                    data: widget.itemProduct[index],
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
        child: const Icon(
          Icons.save_sharp,
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
