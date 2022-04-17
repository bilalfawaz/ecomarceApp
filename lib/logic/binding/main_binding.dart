import 'package:ecomarceapp/logic/controller/main_controller.dart';
import 'package:get/get.dart';

import '../controller/settings_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainController());
    Get.put(SettingController());
  }
}