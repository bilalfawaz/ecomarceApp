import 'package:ecomarceapp/logic/controller/theme_controller.dart';
import 'package:ecomarceapp/utils/my_string.dart';
import 'package:ecomarceapp/utils/route/route.dart';
import 'package:ecomarceapp/utils/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';



void main()async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   await GetStorage.init();
   SystemChrome.setPreferredOrientations([
     DeviceOrientation.portraitDown,
     DeviceOrientation.portraitUp,

   ]);
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemesApp.light,
      themeMode: ThemeController().themeDataGet,
      darkTheme: ThemesApp.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>(authValue) == true
          ? AppRoutes.mainScreen
          : AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}
