import 'package:app_ban_game/ui_values.dart';
import 'package:app_ban_game/widgets/button_register_widget.dart';
import 'package:app_ban_game/widgets/form_login_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController emailRegisterController = TextEditingController();
  final TextEditingController passwordRegisterController = TextEditingController();
  final TextEditingController passwordRegisterController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30.0),
            margin: EdgeInsets.only(top: 30),
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
                const SizedBox(height: 50,),
                Text(
                  'Đăng kí',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(height: 20,),
                //email
                FormLoginWidget(controller: emailRegisterController,text: 'Email',obscure: false,textInputType: TextInputType.emailAddress,),
                const SizedBox(height: 20,),
                //pass
                FormLoginWidget(controller: passwordRegisterController, text: 'Password', textInputType: TextInputType.text, obscure: true),             
                const SizedBox(height: 20,),
                //pass confirm
                FormLoginWidget(controller: passwordRegisterController2, text: 'Confirm Password', textInputType: TextInputType.text, obscure: true),             
                const SizedBox(height: 20,),

                ButtonRegisterWidget(),
                const SizedBox(height: 20,),
                Center(
                  child: Text(
                      '- Hoặc đăng kí với -',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                      ),
                    ),
                ),
                const SizedBox(height: 30,),
                Center(
                  child: Image.asset(
                    'assets/imgs/logoGG.png',
                    height: 25,
                  ),
                ),
                const SizedBox(height: 30,),
              ]
            ),
          ) 
        ),
      ),
    );
  }
}