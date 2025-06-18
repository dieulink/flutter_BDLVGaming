import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.navigate_before, color: mainColor, size: 30),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Giỏ hàng",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: mainColor,
              ),
            ),
          ),
          Spacer(),
          Icon(Icons.more_vert, color: mainColor, size: 30),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
