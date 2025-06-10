import 'dart:async';

import 'package:app_ban_game/screens/login_screens/login_page.dart';
import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(
        () => LoginPage(),
        transition: Transition.noTransition,
        duration: const Duration(milliseconds: 1600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Hero(
          tag: 'logo',
          child: Image.asset('assets/imgs/logo.png', height: 300),
        ),
      ),
    );
  }
}
