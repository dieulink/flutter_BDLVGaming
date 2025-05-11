import 'package:app_ban_game/ui_values.dart';
import 'package:app_ban_game/widgets/profile_item_widget.dart';
import 'package:flutter/material.dart';

// File: profile_page.dart

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Center(
              child: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: 115,
              height: 115,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/imgs/imgProfile.png"),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Nguyễn Thị Diệu Linh',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 40,),
            ProfileItemWidget(icon: Icons.person_2_outlined, text: "Thông tin tài khoản", page: "infoPage"),
            SizedBox(height: 20,),
            ProfileItemWidget(icon: Icons.settings_outlined, text: "Cài đặt", page: "infoPage"),
            SizedBox(height: 20,),
            ProfileItemWidget(icon: Icons.question_mark_rounded, text: "Trung tâm trợ giúp", page: "infoPage"),
            SizedBox(height: 20,),
            ProfileItemWidget(icon: Icons.list, text: "Lịch sử mua hàng", page: "infoPage"),
            SizedBox(height: 20,),
            ProfileItemWidget(icon: Icons.logout_outlined, text: "Đăng xuất", page: "infoPage"),
            SizedBox(height: 20,),
          ],
        )
        ),
      );
  }
}