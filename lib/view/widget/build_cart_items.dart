import 'package:ecomarceapp/utils/themes.dart';
import 'package:ecomarceapp/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildCartItems extends StatelessWidget {
  BuildCartItems({Key? key,this.textColor,this.image,this.price,this.rate}) : super(key: key);
  Color? textColor;
  String? image;
  double? price,rate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_outline,
                      color: textColor
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: textColor,
                    ))
              ],
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.17,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                image!,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextUtils(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      text: "\$ $price",
                      color: textColor!,
                      underLine: TextDecoration.none),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3,right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              text: "${rate!}",
                              color: Colors.white,
                              underLine: TextDecoration.none),
                          const Icon(Icons.star,size: 13,color: Colors.white,)
                        ],
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.02,
                    width: 45,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        decoration:
            BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15), boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ]),
      ),
    );
  }
}
