import 'package:ecomarceapp/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizedList extends StatefulWidget {
  const SizedList({Key? key}) : super(key: key);

  @override
  State<SizedList> createState() => _SizedListState();
}

class _SizedListState extends State<SizedList> {
  ///IF sized Retrieve from api remove this list
  List<String> sizedList = ['S', 'M', 'L', 'XL', 'XXL'];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: Container(
                child: Text(
                  sizedList[index],
                  style: TextStyle(
                      color:
                          currentIndex == index ? Colors.white : Colors.black),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Get.isDarkMode
                            ? pinkClr
                            : mainColor.withOpacity(0.4)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.withOpacity(0.4))),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: sizedList.length),
    );
  }
}
