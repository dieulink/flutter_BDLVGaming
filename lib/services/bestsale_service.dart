import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_ban_game/models/game_item.dart';

class BestSaleService {
  static Future<List<GameItem>> fetchBestSellingGames(int page) async {
    final uri = Uri.parse(
      'http://192.168.110.57:8080/home/gameListBestSale/$page',
    );
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List rawList = data['gameList'];

      return rawList.map((e) => GameItem.fromList(e)).toList();
    } else {
      throw Exception('Failed to load best-selling games');
    }
  }
}
