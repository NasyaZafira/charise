import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/base_app_bar.dart';

class PaymentSummary extends StatefulWidget {
  const PaymentSummary({Key? key}) : super(key: key);

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

class _PaymentSummaryState extends State<PaymentSummary> {
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
                  title: "Payment Summary",
                  onBackPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
