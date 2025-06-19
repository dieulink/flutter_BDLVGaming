import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_ban_game/models/add_review_request.dart';

class AddReviewService {
  static const String _baseUrl = 'http://192.168.5.136:8080';

  static Future<bool> addReview(AddReviewRequest review) async {
    final url = Uri.parse('$_baseUrl/addReview');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(review.toJson());

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['status'] == 'success';
      }
      return false;
    } catch (e) {
      print('Lỗi khi gọi API đánh giá: $e');
      return false;
    }
  }
}
