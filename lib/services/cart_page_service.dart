import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_ban_game/models/cart_response_dto.dart';

class CartPageService {
  static const String baseUrl = 'http://192.168.5.136:8080';

  static Future<CartResponseDto> fetchCart(int userId) async {
    final url = Uri.parse('$baseUrl/listCart');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': userId}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return CartResponseDto.fromJson(data);
    } else {
      throw Exception('Lỗi khi tải giỏ hàng: ${response.statusCode}');
    }
  }
}
