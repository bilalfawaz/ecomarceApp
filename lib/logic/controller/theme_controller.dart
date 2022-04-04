import 'package:ecomarceapp/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController{

  final GetStorage getStorage = GetStorage();
  final key = 'theme';

  saveTheme(value){
    getStorage.write(key, value);
  }

  bool getTheme(){
    return getStorage.read<bool>(key) ?? false;
  }

  ThemeMode get themeDataGet => getTheme() ? ThemeMode.light : ThemeMode.dark;


  void changesTheme(){
    Get.changeThemeMode(getTheme() ?ThemeMode.light : ThemeMode.dark);
    saveTheme(!getTheme());
    // Get.isDarkMode ?
    // Get.changeThemeMode(ThemeMode.light):
    // Get.changeThemeMode(ThemeMode.dark);
  }
}