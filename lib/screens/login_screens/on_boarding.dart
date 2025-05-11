import 'dart:async';

import 'package:app_ban_game/screens/login_screens/login_page.dart';
import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(seconds: 3), () {
          Get.to(
            () => LoginPage(),
            transition: Transition.noTransition,
            duration: Duration(milliseconds: 1600),
            curve: Curves.easeInOut            
            );
        });
    });
  return Scaffold(
    backgroundColor: mainColor,
    body: Center(
      child: Hero(
        tag: 'logo',
        child: Image.asset(
          'assets/imgs/logo.png',
          height: 300,
        ),
      ),
    ),
  );
  }
}