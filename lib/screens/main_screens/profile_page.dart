import 'package:app_ban_game/ui_values.dart';
import 'package:app_ban_game/widgets/profile_item_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: const Text(
          'Thông tin',
          style: TextStyle(
            color: mainColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        iconTheme: const IconThemeData(color: mainColor),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(height: 20),
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
            SizedBox(height: 40),
            ProfileItemWidget(
              icon: Icons.person_2_outlined,
              text: "Thông tin tài khoản",
              onTap: () {
                Navigator.pushNamed(context, 'infoPage');
              },
            ),

            SizedBox(height: 30),
            ProfileItemWidget(
              icon: Icons.settings_outlined,
              text: "Cài đặt",
              onTap: () {
                Navigator.pushNamed(context, 'infoPage');
              },
            ),
            SizedBox(height: 30),
            ProfileItemWidget(
              icon: Icons.question_mark_rounded,
              text: "Trung tâm trợ giúp",
              onTap: () {
                Navigator.pushNamed(context, 'helpPage');
              },
            ),
            SizedBox(height: 30),
            ProfileItemWidget(
              icon: Icons.logout_outlined,
              text: "Đăng xuất",
              onTap: () {
                showDialog(
                  context: context,
                  builder:
                      (_) => AlertDialog(
                        title: Text('Xác nhận'),
                        content: Text('Bạn có chắc chắn muốn đăng xuất không?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Hủy'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // đóng dialog
                              Navigator.pushReplacementNamed(
                                context,
                                'loginPage',
                              );
                            },
                            child: Text('Đăng xuất'),
                          ),
                        ],
                      ),
                );
              },
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
