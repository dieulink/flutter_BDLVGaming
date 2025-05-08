import 'package:app_ban_game/screens/login_screens/on_boarding.dart';
import 'package:app_ban_game/screens/main_screens/cart_page.dart';
import 'package:app_ban_game/screens/main_screens/item_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
     ),
     routes: {
      "/" : (context) => OnBoarding(), //Home(),
      "cartPage" : (context) => CartPage(),
      "itemPage" : (context) => ItemPage(),
     },
    );
  }
}