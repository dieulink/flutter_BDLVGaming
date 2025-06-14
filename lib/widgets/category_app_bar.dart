import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';

class CategoryAppBar extends StatelessWidget {
  final String categoryName;
  const CategoryAppBar({super.key, required this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context); //trở về page trước
            },
            child: Icon(Icons.navigate_before, color: mainColor, size: 30),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              categoryName,
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
}
