import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_profile.dart';

class UserService {
  final String baseUrl = "http://192.168.5.136:8080";

  Future<UserProfile?> fetchUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString("user");

    if (userJson == null) return null;

    final userMap = jsonDecode(userJson);
    final int userId = userMap['userId'];

    final response = await http.post(
      Uri.parse('$baseUrl/userProfile'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"userId": userId}),
    );

    if (response.statusCode == 200) {
      return UserProfile.fromJson(jsonDecode(response.body));
    } else {
      print('Lỗi lấy thông tin người dùng: ${response.body}');
      return null;
    }
  }
}
