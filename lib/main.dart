import 'package:ecomarceapp/utils/route/route.dart';
import 'package:ecomarceapp/utils/themes.dart';
import 'package:ecomarceapp/view/screen/main_page.dart';
import 'package:ecomarceapp/view/screen/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



void main()async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

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
      darkTheme: ThemesApp.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.welcomeScreen,
      getPages: AppRoutes.routes,
    );
  }
}
