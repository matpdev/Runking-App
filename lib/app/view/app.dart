import 'package:runking_app/globalController/user_controller.dart';
import 'package:runking_app/pages/splashscreen/splashscreen_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final userData = Get.put<UserController>(UserController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
        fontFamily: GoogleFonts.sourceSansPro().fontFamily,
      ),
      defaultTransition: Transition.fadeIn,
      home: const SplashScreenPage(),
    );
  }
}
