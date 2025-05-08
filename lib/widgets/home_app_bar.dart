import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;


class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/logo.png',
            width: 50,
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "BDLVGaming",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: mainColor,            ),
            ),
          ),
          Spacer(),
          badges.Badge(
            badgeContent: const Text(
              '3',
              style: TextStyle(
                color: Colors.white
                ),
              ),
            badgeStyle: badges.BadgeStyle(
              badgeColor: Colors.red,  
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "cartPage");
              },
              child: Image.asset(
                'assets/icons/cart.png',
                width: 30,
                height: 30,
              )
            ),
          )

        ],
      ),
    );
  }
}