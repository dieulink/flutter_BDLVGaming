import 'package:app_ban_game/models/login_request.dart';
import 'package:app_ban_game/services/login_service.dart';
import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';

class ButtonLoginWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const ButtonLoginWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
  final email = emailController.text.trim();
  final pass = passwordController.text.trim();
  if (email.isEmpty || pass.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Vui lòng nhập đầy đủ thông tin')),
    );
    return;
  }

  final loginRequest = LoginRequest(email: email, password: pass);
  bool success = await LoginService.login(loginRequest);

  if (success) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Đăng nhập thành công')),
    );
    Navigator.pushNamed(context, 'successPage'); 
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Đăng nhập thất bại')),
    );
  }
},
      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Text(
          'Đăng nhập',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
