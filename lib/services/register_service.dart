import 'dart:convert';
import 'package:app_ban_game/models/login_request.dart';
import 'package:app_ban_game/models/register_request.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class RegisterService {
  static Future<bool> register(RegisterRequest request) async {
    final url = Uri.parse('http://192.168.5.136:8080/registerApi');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(request.toJson());

    print('Dữ liệu gửi đi: $body');

    try {
      final response = await http.post(url, headers: headers, body: body);

      print('Mã trạng thái: ${response.statusCode}');
      print('Phản hồi server: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final token = jsonResponse['token'];

        print('Token nhận được: $token');

        // Giải mã token để kiểm tra
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        print('Giải mã token: $decodedToken');

        // Lưu token vào SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt_token', token);
        print(token);

        return true; // login thành công
      } else {
        print('Lỗi đăng nhập: ${response.body}');
        return false;
      }
    } catch (e) {
      print("Lỗi khi gửi yêu cầu đăng nhập: $e");
      return false;
    }
  }
}
