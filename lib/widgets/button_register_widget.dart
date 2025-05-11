import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';

class ButtonRegisterWidget extends StatelessWidget {
  const ButtonRegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {
        Navigator.pushNamed(context, 'successPage');
      } ,
      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          'Đăng kí',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}