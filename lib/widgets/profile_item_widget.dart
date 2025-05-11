import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({super.key, required this.icon, required this.text, required this.page});
  final IconData icon;
  final String text;
  final String page;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color.fromARGB(52, 206, 206, 206),
        borderRadius: BorderRadius.circular(6)
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context,page);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Icon(
                icon,
                size: 30,
                color: mainColor,
              ),
              SizedBox(width: 20,),
              Text(
                text,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 15
                ),
              ),
              Spacer(),
              Icon(
                Icons.navigate_next_sharp,
                size: 30,
                color: Colors.grey[800],
              )
            ],
          ),
        ),
      ) 
      );
  }
}