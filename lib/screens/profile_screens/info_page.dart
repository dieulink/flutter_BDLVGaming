import 'package:flutter/material.dart';
import 'package:app_ban_game/services/user_service.dart';
import 'package:app_ban_game/models/user_profile.dart';
import 'package:app_ban_game/widgets/info_widget.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  UserProfile? userProfile;
  final UserService _userService = UserService();

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  void _loadUserProfile() async {
    final profile = await _userService.fetchUserProfile();
    setState(() {
      userProfile = profile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông tin tài khoản"),
        centerTitle: true,
      ),
      body:
          userProfile == null
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    InfoWidget(
                      title: "Họ và tên",
                      value: userProfile!.username,
                    ),
                    InfoWidget(title: "Email", value: userProfile!.email),
                    InfoWidget(
                      title: "Số điện thoại",
                      value: userProfile!.phone,
                    ),
                    const InfoWidget(
                      title: "Mật khẩu",
                      value: "********",
                      isPassword: true,
                    ),
                  ],
                ),
              ),
    );
  }
}
