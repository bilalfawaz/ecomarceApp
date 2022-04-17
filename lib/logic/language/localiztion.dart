import 'package:ecomarceapp/logic/language/ar.dart';
import 'package:ecomarceapp/logic/language/en.dart';
import 'package:get/route_manager.dart';

import '../../utils/my_string.dart';

class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
      };
}
