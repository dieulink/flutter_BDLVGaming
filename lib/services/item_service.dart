import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_ban_game/models/game_item.dart';

class ItemService {
  static Future<Map<String, dynamic>> fetchGamesByCategory({
    required int page,
    required int categoryId,
  }) async {
    final uri = Uri.parse('http://192.168.5.136:8080/home/gameList/$page');
    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List rawList = data['gameList'];

      final List<GameItem> gameItems =
          rawList.map((e) => GameItem.fromList(e)).toList();

      return {'totalPages': data['totalPages'], 'games': gameItems};
    } else {
      throw Exception('Lỗi API với mã: ${response.statusCode}');
    }
  }
}
