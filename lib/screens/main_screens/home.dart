import 'package:app_ban_game/screens/main_screens/list_page.dart';
import 'package:app_ban_game/screens/main_screens/home_page.dart';
import 'package:app_ban_game/screens/main_screens/likes_page.dart';
import 'package:app_ban_game/screens/main_screens/notifications_page.dart';
import 'package:app_ban_game/screens/main_screens/profile_page.dart';
import 'package:app_ban_game/ui_values.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  int selectedIndex = 2;

  final List<Widget> pages = [
    LikesPage(),
    NotificationsPage(),
    HomePage(),
    ListPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: mainColor,
        height: 65,
        animationDuration: Duration(milliseconds: 300),
        index: selectedIndex,
        items: const [
          Icon(Icons.favorite_border, size: 30, color: Colors.white),
          Icon(Icons.notifications_outlined, size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.list_alt_outlined, size: 30, color: Colors.white),
          Icon(Icons.person_2_outlined, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
