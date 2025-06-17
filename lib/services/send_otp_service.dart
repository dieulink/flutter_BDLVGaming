import 'dart:convert';
import 'package:app_ban_game/models/email_request.dart';
import 'package:app_ban_game/models/login_request.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SendOtpService {
  static Future<bool> sendOtpService(EmailRequest request) async {
    final url = Uri.parse('http://192.168.110.57:8080/sendOTP');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(request.toJson());

    print('Dữ liệu gửi đi: $body');

    try {
      final response = await http.post(url, headers: headers, body: body);

      print('Mã trạng thái: ${response.statusCode}');
      print('Phản hồi server: ${response.body}');

      if (response.statusCode == 200) {
        final bool result = jsonDecode(response.body);
        return true; // login thành công
      } else {
        print('Lỗi: ${response.body}');
        return false;
      }
    } catch (e) {
      print("Lỗi khi gửi yêu cầu: $e");
      return false;
    }
  }
}
