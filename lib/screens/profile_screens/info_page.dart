import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.navigate_before,
                      color: mainColor,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 115,
              height: 115,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/imgs/imgProfile.png"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Nguyễn Thị Diệu Linh',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
