import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_ban_game/models/order_history.dart';

class OrderHistoryService {
  static Future<List<OrderHistory>> fetchHistoryByUserId(int userId) async {
    final response = await http.post(
      Uri.parse('http://192.168.5.136:8080/orderHistory'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': userId}),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => OrderHistory.fromJson(e)).toList();
    } else {
      throw Exception('Lỗi khi tải lịch sử đơn hàng');
    }
  }
}
