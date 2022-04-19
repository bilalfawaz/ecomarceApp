import 'package:ecomarceapp/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/cart_controller.dart';
import '../../../utils/my_string.dart';
import '../../../utils/themes.dart';
import '../../widget/payment_widget/delivery_container_widget.dart';
import '../../widget/payment_widget/payment_method_widget.dart';


class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);
  var carController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Payment"),
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  text: "Shipping To",
                  color: Get.isDarkMode ? Colors.white:Colors.black,
                  underLine: TextDecoration.none),
              const SizedBox(height: 20,),
              const DeliveryContainerWidget(),
              const SizedBox(height: 20,),
              TextUtils(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  text: "Payment Method",
                  color: Get.isDarkMode ? Colors.white:Colors.black,
                  underLine: TextDecoration.none),
              const SizedBox(height: 20,),
              const PaymentMethodWidget(),
              const SizedBox(height: 30,),
              Center(
                child: TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    text: "${carController.total} \$",
                    color: Colors.black,
                    underLine: TextDecoration.none),
              ),
              const SizedBox(height: 20,),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Get.isDarkMode ? pinkClr : mainColor ,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                    onPressed: (){},
                    child:const Text("Pay Now",style: TextStyle(
                      fontSize: 22,
                      color: Colors.white
                    ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
