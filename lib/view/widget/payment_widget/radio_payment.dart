import 'package:flutter/material.dart';

import '../text_utils.dart';

class RadioPayment extends StatefulWidget {
  RadioPayment(
      {Key? key,
      required this.onChange,
      required this.groupValue,
      required this.title,
      required this.value,
      required this.color,
      required this.image})
      : super(key: key);
  Color color;
  int value;
  int groupValue;
  Function onChange;
  String? title,image;
  @override
  State<RadioPayment> createState() => _RadioPaymentState();
}

class _RadioPaymentState extends State<RadioPayment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(widget.image??"",scale: 1.5,),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextUtils(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      text: widget.title?? "",
                      color: Colors.black,
                      underLine: TextDecoration.none),
                  const SizedBox(height: 5,),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Radio(
                value: widget.value,
                groupValue: widget.groupValue,
                onChanged: (value) {
                  widget.onChange(value);
                },
                fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
