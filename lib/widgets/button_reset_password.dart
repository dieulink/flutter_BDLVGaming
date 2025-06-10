import 'package:app_ban_game/models/register_request.dart';
import 'package:app_ban_game/models/reset_password_request.dart';
import 'package:app_ban_game/services/reset_password_service.dart';
import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';
import 'package:app_ban_game/services/register_service.dart';

class ButtonResetPassword extends StatelessWidget {
  final TextEditingController emailResetController;
  final TextEditingController otpController;
  final TextEditingController passwordResetController;
  final TextEditingController passwordCheckController;
  final GlobalKey<FormState> formKey;

  const ButtonResetPassword({
    super.key,
    required this.otpController,
    required this.emailResetController,
    required this.passwordResetController,
    required this.passwordCheckController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final otp = otpController.text.trim();
        final email = emailResetController.text.trim();
        final pass = passwordResetController.text.trim();
        final passCheck = passwordCheckController.text.trim();

        if (!formKey.currentState!.validate()) {
          return;
        }
        if (passCheck != pass) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Mật khẩu xác nhận không đúng !')),
          );
          return;
        }

        final resetPasswordRequest = ResetPasswordRequest(
          otp: otp,
          email: email,
          password: pass,
        );

        bool success = await ResetPasswordService.resetPasswordService(
          resetPasswordRequest,
        );

        if (success) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Đổi mật khẩu thành công')));
          Navigator.pushNamed(context, 'homePage');
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Đổi mật khẩu thất bại')));
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
          'Đặt lại mật khẩu',
          style: TextStyle(color: white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
