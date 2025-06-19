import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_ban_game/models/add_order_request.dart';

class OrderService {
  static Future<bool> addOrder(AddOrderRequest order) async {
    final url = Uri.parse('http://192.168.5.136:8080/addOrder');
    final headers = {'Content-Type': 'application/json'};

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(order.toJson()),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['status'] == 'success';
    } else {
      throw Exception('Failed to add order: ${response.statusCode}');
    }
  }
}
