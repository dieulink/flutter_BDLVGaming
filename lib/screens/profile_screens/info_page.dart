import 'package:app_ban_game/ui_values.dart';
import 'package:app_ban_game/widgets/info_app_bar.dart';
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
  bool isEditingName = false;
  final TextEditingController _nameController = TextEditingController();
  bool isEditingPhone = false;
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  void _loadUserProfile() async {
    final profile = await _userService.fetchUserProfile();
    if (profile != null) {
      setState(() {
        userProfile = profile;
        _nameController.text = profile.username;
        _phoneController.text = profile.phone;
      });
    }
  }

  void _saveUsername() async {
    final newName = _nameController.text.trim();
    if (newName.isEmpty || userProfile == null) return;

    final updatedProfile = await _userService.editUsername(
      email: userProfile!.email,
      newUsername: newName,
    );

    if (updatedProfile != null) {
      setState(() {
        userProfile = updatedProfile;
        isEditingName = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Đã cập nhật họ tên')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Cập nhật thất bại')));
    }
  }

  void _savePhone() async {
    final newPhone = _phoneController.text.trim();
    if (newPhone.isEmpty || userProfile == null) return;

    final updatedProfile = await _userService.editPhone(
      email: userProfile!.email,
      newPhone: newPhone,
    );

    if (updatedProfile != null) {
      setState(() {
        userProfile = updatedProfile;
        isEditingPhone = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã cập nhật số điện thoại')),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Cập nhật thất bại')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InfoAppBar(),
      body:
          userProfile == null
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
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
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() => isEditingName = true);
                      },
                      child: InfoWidget(
                        title: "Họ và tên",
                        value: userProfile!.username,
                        isEditable: true,
                        controller: isEditingName ? _nameController : null,
                        onSave: isEditingName ? _saveUsername : null,
                      ),
                    ),
                    InfoWidget(title: "Email", value: userProfile!.email),
                    GestureDetector(
                      onTap: () {
                        setState(() => isEditingPhone = true);
                      },
                      child: InfoWidget(
                        title: "Số điện thoại",
                        value: userProfile!.phone,
                        isEditable: true,
                        controller: isEditingPhone ? _phoneController : null,
                        onSave: isEditingPhone ? _savePhone : null,
                      ),
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
