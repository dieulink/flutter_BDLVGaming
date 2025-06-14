import 'package:app_ban_game/screens/login_screens/forgot_password.dart';
import 'package:app_ban_game/screens/login_screens/register_page.dart';
import 'package:app_ban_game/screens/login_screens/reset_password.dart';
import 'package:app_ban_game/screens/login_screens/success_page.dart';
import 'package:app_ban_game/screens/main_screens/profile_page.dart';
import 'package:app_ban_game/screens/main_screens/search_game_page.dart';
import 'package:app_ban_game/screens/profile_screens/info_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_ban_game/screens/login_screens/on_boarding.dart';
import 'package:app_ban_game/screens/main_screens/cart_page.dart';
import 'package:app_ban_game/screens/main_screens/home.dart';
import 'package:app_ban_game/screens/main_screens/item_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routes: {
        "/": (context) => Home(), //OnBoarding(),
        "cartPage": (context) => CartPage(),
        "itemPage": (context) => ItemPage(),
        "homePage": (context) => Home(),
        "registerPage": (context) => RegisterPage(),
        "successPage": (context) => SuccessPage(),
        "infoPage": (context) => InfoPage(),
        "forgotPass": (context) => ForgotPassword(),
        "resetPass": (context) => ResetPassword(),
      },
    );
  }
}
