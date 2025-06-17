import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/review_model.dart';

class ReviewService {
  final String baseUrl = "http://192.168.110.57:8080";

  Future<List<ReviewModel>> getReviews(int gameId, int page) async {
    final url = Uri.parse('$baseUrl/reviewList?gameId=$gameId&page=$page');
    final response = await http.get(url);
    print(response);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List reviews = data['reviewList'];
      return reviews.map((e) => ReviewModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load reviews');
    }
  }
}
