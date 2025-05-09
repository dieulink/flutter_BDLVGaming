import 'package:app_ban_game/ui_values.dart';
import 'package:app_ban_game/widgets/form_login_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passworrdController = TextEditingController();
  final TextEditingController passworrdController2 = TextEditingController();
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
                //email
                FormLoginWidget(controller: emailController,text: 'Email',obscure: false,textInputType: TextInputType.emailAddress,),
                const SizedBox(height: 20,),
                //pass
                FormLoginWidget(controller: passworrdController, text: 'Password', textInputType: TextInputType.text, obscure: true),             
                const SizedBox(height: 20,),
                //pass confirm
                FormLoginWidget(controller: passworrdController2, text: 'Confirm Password', textInputType: TextInputType.text, obscure: true),             
                const SizedBox(height: 20,),
              ]
            ),
          ) 
        ),
      ),
    );
  }
}