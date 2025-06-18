import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_ban_game/models/review_request.dart';

class AddReviewService {
  static const String baseUrl = 'http://192.168.5.136:8080/api/review';

  static Future<void> addReview(ReviewRequest review) async {
    final url = Uri.parse('$baseUrl/addReview');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(review.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Lỗi gửi đánh giá: ${response.body}');
    }
  }
}
