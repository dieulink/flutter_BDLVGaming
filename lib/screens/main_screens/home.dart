import 'package:app_ban_game/screens/main_screens/home_page.dart';
import 'package:app_ban_game/screens/main_screens/likes_page.dart';
import 'package:app_ban_game/screens/main_screens/notifications_page.dart';
import 'package:app_ban_game/screens/main_screens/profile_page.dart';
import 'package:app_ban_game/ui_values.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {

  int selectedIndex = 0;

    final List<Widget> pages = [
    HomePage(),
    LikesPage(),
    NotificationsPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          child: GNav(
            backgroundColor: Colors.white,
            color: mainColor,
            activeColor: Colors.white,
            tabBackgroundColor: mainColor,
            padding: EdgeInsets.all(10),
            tabs: const [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.favorite_border, text: 'Likes'),
              GButton(icon: Icons.notifications_outlined, text: 'Notices'),
              GButton(icon: Icons.person_2_outlined, text: 'Profile'),
            ],
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
} 