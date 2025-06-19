import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_ban_game/models/user_profile.dart';

class UserService {
  static const String _baseUrl = 'http://192.168.5.136:8080';

  Future<UserProfile?> fetchUserProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final decodeJson = prefs.getString('decode_token');

      if (decodeJson == null) return null;

      final userId = jsonDecode(decodeJson)['userId'];
      final url = Uri.parse('$_baseUrl/userProfile');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"userId": userId}),
      );
      print("Đang gửi userId: $userId");
      print("Response body: ${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return UserProfile.fromJson(data);
      } else {
        print('Lỗi khi gọi API: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Lỗi fetchUserProfile: $e');
      return null;
    }
  }

  Future<UserProfile?> editUsername({
    required String email,
    required String newUsername,
  }) async {
    const url = 'http://192.168.5.136:8080/editUsername';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "userName": newUsername}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return UserProfile.fromJson(data);
      } else {
        print("Lỗi khi cập nhật tên: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Lỗi kết nối editUsername: $e");
      return null;
    }
  }

  Future<UserProfile?> editPhone({
    required String email,
    required String newPhone,
  }) async {
    const url = 'http://192.168.5.136:8080/editPhone'; // thay IP nếu cần
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "phone": newPhone}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return UserProfile.fromJson(data);
      } else {
        print("Lỗi khi cập nhật số điện thoại: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Lỗi kết nối editPhone: $e");
      return null;
    }
  }

  Future<UserProfile?> editPassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  }) async {
    const url = 'http://192.168.5.136:8080/editPassword'; // IP của bạn

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": email,
          "password": newPassword,
          "oldPassword": oldPassword,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return UserProfile.fromJson(data);
      } else {
        print("Lỗi cập nhật mật khẩu: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Lỗi kết nối editPassword: $e");
      return null;
    }
  }
}
