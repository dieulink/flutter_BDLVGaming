import 'package:flutter/material.dart';
import 'package:app_ban_game/screens/main_screens/home.dart';

class HomeTab extends StatelessWidget {
  final int index;
  const HomeTab({super.key, this.index = 0});

  @override
  Widget build(BuildContext context) {
    return Home(startIndex: index);
  }
}
