import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';

class FormLoginWidget extends StatelessWidget {
  const FormLoginWidget({
    Key? key,
    required this.controller,
    required this.text,
    required this.textInputType,
    required this.obscure,
    this.validator,
  }) : super(key: key);
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: EdgeInsets.only(top: 3, left: 15),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscure,
        validator: validator,
        decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey),
          errorStyle: TextStyle(),
        ),
      ),
    );
  }
}
