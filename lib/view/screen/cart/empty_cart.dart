import 'package:ecomarceapp/utils/my_string.dart';
import 'package:ecomarceapp/utils/route/route.dart';
import 'package:ecomarceapp/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            size: 150,
          ),
          const SizedBox(height: 40),
          RichText(
              text: TextSpan(
                  children: [
                    TextSpan(text:yourCartIs.tr,style: TextStyle(
                      color: Get.isDarkMode?Colors.white: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    )),
                    TextSpan(text: empty.tr,style: TextStyle(
                        color: Get.isDarkMode? pinkClr: mainColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ))
              ])),
          const SizedBox(height: 10,),
           Text(addItemsTo.tr,style: TextStyle(
              color: Get.isDarkMode?Colors.white: Colors.black,
              fontWeight: FontWeight.bold
          ),),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                onPressed: (){
                 Get.back();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary:Get.isDarkMode?pinkClr: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
                child: Text(goToHome.tr,style: TextStyle(
                  fontSize: 20,
                ),)
            ),
          ),
        ],
      ),
    );
  }
}
