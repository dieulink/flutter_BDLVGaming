import 'package:app_ban_game/ui_values.dart';
import 'package:app_ban_game/widgets/button_register_widget.dart';
import 'package:app_ban_game/widgets/button_reset_password.dart';
import 'package:app_ban_game/widgets/form_login_widget.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);

  final TextEditingController otpController = TextEditingController();
  final TextEditingController emailResetController = TextEditingController();
  final TextEditingController passwordResetController = TextEditingController();
  final TextEditingController passwordCheckController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context); //trở về page trước
                    },
                    child: Icon(
                      Icons.navigate_before,
                      color: mainColor,
                      size: 30,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    //margin: EdgeInsets.only(top: 30),
                    child: Image.asset(
                      'assets/icons/logo.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Đặt lại mật khẩu',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FormLoginWidget(
                    controller: otpController,
                    text: 'Mã OTP ',
                    textInputType: TextInputType.text,
                    obscure: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập mã OTP !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  //email
                  FormLoginWidget(
                    controller: emailResetController,
                    text: 'Xác nhận Email',
                    obscure: false,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập Email !';
                      }
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!emailRegex.hasMatch(value)) {
                        return 'Email không đúng định dạng !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  //pass
                  FormLoginWidget(
                    controller: passwordResetController,
                    text: 'Password',
                    textInputType: TextInputType.text,
                    obscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập password !';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  FormLoginWidget(
                    controller: passwordCheckController,
                    text: 'Xác nhận lại password',
                    textInputType: TextInputType.text,
                    obscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng xác nhận password!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ButtonResetPassword(
                    otpController: otpController,
                    emailResetController: emailResetController,
                    passwordResetController: passwordResetController,
                    passwordCheckController: passwordCheckController,
                    formKey: _formKey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
