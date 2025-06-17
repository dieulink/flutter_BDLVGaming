import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.navigate_before,
                      color: mainColor,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Trung tâm trợ giúp",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset('assets/icons/logo.png'),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: TextStyle(
                  color: black,
                  fontSize: 16,
                  height: 1.5, // giãn dòng
                ),
                children: [
                  TextSpan(text: "Chào mừng bạn đến với "),
                  TextSpan(
                    text: "Trung tâm trợ giúp",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        " của chúng tôi! Tại đây, bạn có thể tìm thấy các hướng dẫn sử dụng, câu hỏi thường gặp và cách khắc phục sự cố phổ biến khi sử dụng ứng dụng. ",
                  ),
                  TextSpan(
                    text:
                        "Nếu bạn cần hỗ trợ thêm, vui lòng liên hệ với chúng tôi qua:\n\n",
                  ),
                  TextSpan(
                    text: "Email: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "hotro@ban-game.vn\n"),
                  TextSpan(
                    text: "Số điện thoại: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "0123 456 789\n\n"),
                  TextSpan(
                    text:
                        "Chúng tôi luôn sẵn sàng lắng nghe và hỗ trợ bạn 24/7 để mang lại trải nghiệm tốt nhất!",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
