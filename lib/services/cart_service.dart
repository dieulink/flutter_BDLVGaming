import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_ban_game/models/cart_item.dart';

class CartService {
  static const String _baseUrl = 'http://192.168.110.57:8080';

  static Future<int?> addToCart(CartItem item) async {
    final url = Uri.parse('$_baseUrl/addCart');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(item.toJson());

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 409) {
        return -1; //game đã thêm vào giỏ rồi
      } else {
        return null;
      }
    } catch (e) {
      print('Lỗi khi thêm vào giỏ hàng: $e');
      return null;
    }
  }
}
