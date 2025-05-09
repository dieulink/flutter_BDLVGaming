import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';

class ButtonLoginWidget extends StatelessWidget {
  const ButtonLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {
        Navigator.pushNamed(context, 'homePage');
      } ,
      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          'Đăng nhập',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}