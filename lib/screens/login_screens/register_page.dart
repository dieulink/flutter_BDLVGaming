import 'package:app_ban_game/ui_values.dart';
import 'package:app_ban_game/widgets/button_register_widget.dart';
import 'package:app_ban_game/widgets/form_login_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController emailRegisterController = TextEditingController();
  final TextEditingController phoneRegisterController = TextEditingController();
  final TextEditingController passwordRegisterController =
      TextEditingController();
  final TextEditingController usernameRegisterController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30.0),
            margin: EdgeInsets.only(top: 30),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/icons/logo.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Đăng kí',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  //email
                  FormLoginWidget(
                    controller: emailRegisterController,
                    text: 'Email',
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
                  //phone
                  FormLoginWidget(
                    controller: phoneRegisterController,
                    text: 'Số điện thoại',
                    textInputType: TextInputType.phone,
                    obscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập số điện thoại !';
                      }
                      final phoneRegExp = RegExp(r'^0\d{9,10}$');
                      if (!phoneRegExp.hasMatch(value)) {
                        return 'Số điện thoại không hợp lệ !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  //pass
                  FormLoginWidget(
                    controller: passwordRegisterController,
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
                  const SizedBox(height: 20),
                  //name
                  FormLoginWidget(
                    controller: usernameRegisterController,
                    text: 'Tên người dùng',
                    textInputType: TextInputType.text,
                    obscure: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập password !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  ButtonRegisterWidget(
                    emailRegisterController: emailRegisterController,
                    phoneRegisterController: phoneRegisterController,
                    passwordRegisterController: passwordRegisterController,
                    usernameRegisterController: usernameRegisterController,
                    formKey: _formKey,
                  ),

                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      '- Hoặc đăng kí với -',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Image.asset('assets/imgs/logoGG.png', height: 25),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
