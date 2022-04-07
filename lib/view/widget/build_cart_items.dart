import 'package:ecomarceapp/utils/themes.dart';
import 'package:ecomarceapp/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildCartItems extends StatelessWidget {
  BuildCartItems({Key? key,this.textColor}) : super(key: key);
  Color? textColor;
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
                "https://images.unsplash.com/photo-1649314185443-ef480f172000?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3270&q=80",
                fit: BoxFit.fitWidth,
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
                      text: "\$ 15",
                      color: textColor!,
                      underLine: TextDecoration.none),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3,right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TextUtils(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              text: "4.7",
                              color: Colors.white,
                              underLine: TextDecoration.none),
                          Icon(Icons.star,size: 13,color: Colors.white,)
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
            BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
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
