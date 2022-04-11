
import 'package:badges/badges.dart';
import 'package:ecomarceapp/logic/controller/cart_controller.dart';
import 'package:ecomarceapp/logic/controller/main_controller.dart';
import 'package:ecomarceapp/utils/route/route.dart';
import 'package:ecomarceapp/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  /// to get a data from previous page
  var arg = Get.arguments;
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx((){
        return Scaffold(
          // backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(controller.title[controller.currentIndex.value]),
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            actions: [
              Obx((){
                return  Badge(
                    position: BadgePosition.topEnd(top: 0, end: 3),
                    animationDuration: Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent:  Text(
                      "${cartController.countProduct()}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                        icon:Image.asset('assets/images/shop.png'), onPressed: () {Get.toNamed(Routes.cartScreen);}));
              }),
              // IconButton(
              //     onPressed: () {
              //       Get.toNamed(Routes.cartScreen);
              //     },
              //     icon: Image.asset('assets/images/shop.png')),
              ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white ,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: "",
                  activeIcon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: "",
                  activeIcon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: "",
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: "",
                  activeIcon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  )),
            ],
            onTap: (index){
              controller.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.taps.value,
          ),
        );
      }),
    );
  }
}
