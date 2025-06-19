import 'package:flutter/material.dart';
import 'package:app_ban_game/ui_values.dart';
import 'package:app_ban_game/widgets/profile_item_widget.dart';
import 'package:app_ban_game/models/user_profile.dart';
import 'package:app_ban_game/services/user_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserProfile? userProfile;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  void _loadUserProfile() async {
    final profile = await UserService().fetchUserProfile();
    setState(() {
      userProfile = profile;
    });
  }

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
      body:
          userProfile == null
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const SizedBox(
                      width: 115,
                      height: 115,
                      child: CircleAvatar(
                        backgroundColor: white,
                        backgroundImage: AssetImage(
                          "assets/imgs/imgProfile.png",
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userProfile!.username,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ProfileItemWidget(
                      icon: Icons.person_2_outlined,
                      text: "Thông tin tài khoản",
                      onTap: () {
                        Navigator.pushNamed(context, 'infoPage');
                      },
                    ),
                    // const SizedBox(height: 30),
                    // ProfileItemWidget(
                    //   icon: Icons.settings_outlined,
                    //   text: "Cài đặt",
                    //   onTap: () {
                    //     Navigator.pushNamed(context, 'infoPage');
                    //   },
                    //),
                    const SizedBox(height: 30),
                    ProfileItemWidget(
                      icon: Icons.question_mark_rounded,
                      text: "Trung tâm trợ giúp",
                      onTap: () {
                        Navigator.pushNamed(context, 'helpPage');
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
    );
  }
}
