import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
  decoration: InputDecoration(
    labelText: 'Email',
    hintText: 'example@gmail.com',
    border: OutlineInputBorder(),
  ),
);

  }
}