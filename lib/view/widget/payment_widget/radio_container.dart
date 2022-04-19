import 'package:ecomarceapp/view/widget/text_utils.dart';
import 'package:flutter/material.dart';

class RadioContainer extends StatefulWidget {
  RadioContainer({Key? key,
    required this.color,
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onChange,
    required this.icon,
    this.name,
    this.address,
    this.phone})
      : super(key: key);
  Color color;
  int value;
  int groupValue;
  Function onChange;
  String? title,name,phone,address;
  Widget icon;

  @override
  State<RadioContainer> createState() => _RadioContainerState();
}

class _RadioContainerState extends State<RadioContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: (value) {
              widget.onChange(value);
            },
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    text: widget.title?? "",
                    color: Colors.black,
                    underLine: TextDecoration.none),
                const SizedBox(height: 5,),
                TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    text: widget.name ?? "",
                    color: Colors.black,
                    underLine: TextDecoration.none),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    const Text("🇯🇴 +962"),
                    TextUtils(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        text: widget.phone ?? "",
                        color: Colors.black,
                        underLine: TextDecoration.none),
                    const SizedBox(width: 120,),
                    SizedBox(
                      child: widget.icon ,
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    text: widget.address ?? "",
                    color: Colors.black,
                    underLine: TextDecoration.none),
              ],
            ),
          )
        ],
      ),
    );
  }
}
