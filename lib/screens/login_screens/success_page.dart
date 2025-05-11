import 'package:app_ban_game/screens/main_screens/home.dart';
import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 3500), () {
        Get.off(() => const Home()); 
      });
    });
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Image.asset(
          'assets/imgs/success.gif'
        ),
      ),
    );
  }
}