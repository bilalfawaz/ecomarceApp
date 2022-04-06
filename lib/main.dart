import 'package:ecomarceapp/logic/controller/theme_controller.dart';
import 'package:ecomarceapp/utils/route/route.dart';
import 'package:ecomarceapp/utils/themes.dart';
import 'package:ecomarceapp/view/screen/main_page.dart';
import 'package:ecomarceapp/view/screen/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';



void main()async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   await GetStorage.init();
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
              GetStorage().read<bool>("auth") == true
          ? AppRoutes.mainScreen
          : AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}
