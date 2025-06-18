import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_ban_game/models/cart_item.dart';

class DeleteCartService {
  static const String _baseUrl = 'http://192.168.5.136:8080';

  static Future<int?> deleteCart(CartItem item) async {
    final url = Uri.parse('$_baseUrl/deleteCart');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(item.toJson());

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return result is int ? result : null;
      } else {
        print('Lỗi server: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Lỗi khi xóa giỏ hàng: $e');
      return null;
    }
  }
}
