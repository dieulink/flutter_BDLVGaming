import 'package:app_ban_game/models/register_request.dart';
import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';
import 'package:app_ban_game/services/register_service.dart';

class ButtonRegisterWidget extends StatelessWidget {
  final TextEditingController emailRegisterController;
  final TextEditingController phoneRegisterController;
  final TextEditingController passwordRegisterController;
  final TextEditingController usernameRegisterController;
  final GlobalKey<FormState> formKey;

  const ButtonRegisterWidget({
    super.key,
    required this.emailRegisterController,
    required this.phoneRegisterController,
    required this.passwordRegisterController,
    required this.usernameRegisterController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final email = emailRegisterController.text.trim();
        final phone = phoneRegisterController.text.trim();
        final pass = passwordRegisterController.text.trim();
        final name = usernameRegisterController.text.trim();

        if (!formKey.currentState!.validate()) {
          return;
        }

        final registerRequest = RegisterRequest(
          username: name,
          email: email,
          password: pass,
          phone: phone,
        );

        bool success = await RegisterService.register(registerRequest);
        if (success) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Đăng kí thành công')));
          Navigator.pushNamed(context, 'successPage');
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Đăng kí thất bại')));
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          'Đăng kí',
          style: TextStyle(color: white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
