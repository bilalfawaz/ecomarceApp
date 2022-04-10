

import 'package:ecomarceapp/view/screen/catogory_screen.dart';
import 'package:ecomarceapp/view/screen/favorite_screen.dart';
import 'package:ecomarceapp/view/screen/home_screen.dart';
import 'package:ecomarceapp/view/screen/setting_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController{

  RxInt currentIndex = 0.obs;

  final taps = [
    HomeScreen(),
    const CatogoryScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ].obs;

  final title = [
    "Asroo Shop",
    "Categories",
    "Favorites",
    "Settings",
  ].obs;

}