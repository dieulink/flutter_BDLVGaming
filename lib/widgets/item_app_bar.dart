import 'package:app_ban_game/ui_values.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class ItemAppBar extends StatelessWidget {
  const ItemAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.navigate_before, color: mainColor, size: 30),
          ),
          Spacer(),
          SizedBox(width: 30),
          badges.Badge(
            badgeContent: const Text(
              '3',
              style: TextStyle(color: Colors.white),
            ),
            badgeStyle: badges.BadgeStyle(badgeColor: Colors.red),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "cartPage");
              },
              child:
              // Image.asset(
              //   'assets/icons/cart.png',
              //   width: 30,
              //   height: 30,
              // )
              Icon(Icons.shopping_cart_outlined, size: 30, color: mainColor),
            ),
          ),
        ],
      ),
    );
  }
}
