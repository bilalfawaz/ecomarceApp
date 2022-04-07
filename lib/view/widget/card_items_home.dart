import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'build_cart_items.dart';


class CardItemsHome extends StatelessWidget {
  CardItemsHome({Key? key,this.textColor}) : super(key: key);
  Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 0.8,
          mainAxisSpacing: 9.0,
          crossAxisSpacing: 6,
          maxCrossAxisExtent: 200
        ),
        itemBuilder: (BuildContext context, int index) {
          return BuildCartItems(textColor: textColor);
        },
      ),
    );
  }
}
