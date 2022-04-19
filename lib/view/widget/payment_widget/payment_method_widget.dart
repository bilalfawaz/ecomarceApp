import 'package:ecomarceapp/view/widget/payment_widget/radio_container.dart';
import 'package:ecomarceapp/view/widget/payment_widget/radio_payment.dart';
import 'package:flutter/material.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int groupIndex = 1;
  bool changeColors = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          RadioPayment(
              image: "assets/images/paypal.png",
              onChange: (value) {
              setState(() {
                groupIndex = value;
              });
              },
              groupValue: groupIndex,
              title: "Paypal",
              value: 1,
              color: Colors.grey[400]!),
          const SizedBox(height: 20,),
          RadioPayment(
              image: "assets/images/google.png",
              onChange: (value) {
                setState(() {
                  groupIndex = value;
                  print(groupIndex);
                });
              },
              groupValue: groupIndex,
              title: "Google Pay",
              value: 2,
              color: Colors.grey[400]!),
          const SizedBox(height: 20,),
          RadioPayment(
              image: "assets/images/credit.png",
              onChange: (value) {
                setState(() {
                  groupIndex = value;
                });
              },
              groupValue: groupIndex,
              title: "Credit Cart",
              value: 3,
              color: Colors.grey[400]!),

        ],
      ),
    );
  }
}
