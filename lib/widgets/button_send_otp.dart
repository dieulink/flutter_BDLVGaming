import 'package:app_ban_game/models/email_request.dart';
import 'package:app_ban_game/models/login_request.dart';
import 'package:app_ban_game/services/login_service.dart';
import 'package:app_ban_game/services/send_otp_service.dart';
import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';

class ButtonSendOtp extends StatelessWidget {
  final TextEditingController emailOtpController;
  final GlobalKey<FormState> formKey;

  const ButtonSendOtp({
    super.key,
    required this.emailOtpController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final email = emailOtpController.text.trim();

        if (!formKey.currentState!.validate()) {
          return;
        }
        final emailRequest = EmailRequest(email: email);
        bool success = await SendOtpService.sendOtpService(emailRequest);

        if (success) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Gửi OTP thành công')));

          Navigator.pushNamed(context, 'successPage');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Email chưa đăng kí hoặc không tồn tại')),
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
          'Nhận mã OTP ',
          style: TextStyle(color: white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
