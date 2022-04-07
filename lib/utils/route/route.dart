import 'package:ecomarceapp/logic/binding/main_binding.dart';
import 'package:ecomarceapp/logic/binding/product_binding.dart';
import 'package:ecomarceapp/view/screen/main_page.dart';
import 'package:ecomarceapp/view/screen/welcome_page.dart';
import 'package:get/get.dart';

import '../../view/screen/auth/login_screen.dart';

class AppRoutes {
  //initialRoute

  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;
  //getPages

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      //binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => const MainPage(),
      bindings: [
        MainBinding(),
        ProductBinding(),
      ],
    ),
    // GetPage(
    //   name: Routes.forgotPasswordScreen,
    //   page: () => ForgotPasswordScreen(),
    //   binding: AuthBinding(),
    // ),
    // GetPage(
    //   name: Routes.mainScreen,
    //   page: () => MainScreen(),
    //   bindings: [
    //     AuthBinding(),
    //     MainBininding(),
    //     ProductBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: Routes.cartScreen,
    //   page: () => CartScreen(),
    //   bindings: [
    //     AuthBinding(),
    //     ProductBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: Routes.paymentScreen,
    //   page: () => PayMentScreen(),
    //   bindings: [
    //     AuthBinding(),
    //     ProductBinding(),
    //     MainBininding(),
    //   ],
    // ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
  static const paymentScreen = '/paymentScreen';
}