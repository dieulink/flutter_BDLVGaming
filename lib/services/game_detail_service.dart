import 'dart:convert';
import 'package:app_ban_game/models/game_detail.dart';
import 'package:http/http.dart' as http;

Future<GameDetail?> fetchGameDetail(int gameId) async {
  final url = Uri.parse('http://192.168.5.136:8080/detail/game/$gameId');
  final response = await http.get(url);

  // print(">>> gameId: $gameId");
  // print(response);
  // print(response.body);

  if (response.statusCode == 200) {
    final decoded = json.decode(response.body);

    final List<dynamic> gameJson = decoded['gameDetail'];

    return GameDetail.fromJson(gameJson);
  } else {
    print('Failed to load game detail: ${response.statusCode}');
    return null;
  }
}
