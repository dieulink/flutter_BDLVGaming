import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/search_game_model.dart';

class SearchGameService {
  static Future<List<SearchGame>> fetchGames(String keyword) async {
    final response = await http.get(
      Uri.parse(
        'http://192.168.5.136:8080/home/search?page=0&searchInput=$keyword',
      ),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final List<dynamic> rawList = body['gameList'];
      return rawList.map((item) => SearchGame.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load search games');
    }
  }
}
