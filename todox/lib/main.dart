import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todox/bindings/bindings.dart';
import 'package:todox/page/home.dart';
import 'package:todox/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.circularReveal,
      getPages: Routes.pages,
      initialRoute: '/home',
      initialBinding: MyBindings(),
    );
  }

  static void changeColor(Color color, Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: color, statusBarIconBrightness: brightness));
  }
}
