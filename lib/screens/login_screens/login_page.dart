import 'package:app_ban_game/screens/login_screens/register_page.dart';
import 'package:app_ban_game/ui_values.dart';
import 'package:app_ban_game/widgets/button_login_widget.dart';
import 'package:app_ban_game/widgets/form_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passworrdController = TextEditingController();
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
                    child: Hero(
                      tag: 'logo',
                      child: Image.asset(
                        'assets/icons/logo.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Đăng nhập',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  //email
                  FormLoginWidget(
                    controller: emailController,
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
                  //pass
                  FormLoginWidget(
                    controller: passworrdController,
                    text: 'Mật khẩu',
                    textInputType: TextInputType.text,
                    obscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập Mật khẩu !';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "forgotPass");
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Quên mật khẩu ?',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ButtonLoginWidget(
                    emailController: emailController,
                    passwordController: passworrdController,
                    formKey: _formKey,
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Text(
                      '- Hoặc đăng nhập với -',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Image.asset('assets/imgs/logoGG.png', height: 25),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bạn chưa có tài khoản ?',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "registerPage");
                        },
                        child: Text(
                          ' Đăng kí',
                          style: TextStyle(fontSize: 15, color: mainColor),
                        ),
                      ),
                    ],
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
