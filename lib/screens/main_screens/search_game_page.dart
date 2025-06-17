import 'package:app_ban_game/models/search_game_model.dart';
import 'package:app_ban_game/screens/main_screens/item_page.dart';
import 'package:app_ban_game/services/search_game_service.dart';
import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';
import 'package:app_ban_game/models/game_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchGamePage extends StatefulWidget {
  final String searchInput;

  const SearchGamePage({super.key, required this.searchInput});

  @override
  State<SearchGamePage> createState() => _SearchGamePageState();
}

class _SearchGamePageState extends State<SearchGamePage> {
  final TextEditingController _searchController = TextEditingController();
  List<SearchGameModel> games = [];
  bool isLoading = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.searchInput;
    _fetchGames(widget.searchInput);
  }

  void _fetchGames(String query) async {
    if (query.isEmpty) return;

    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final result = await SearchGameService.fetchGames(query);
      setState(() {
        games = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Đã xảy ra lỗi khi tải dữ liệu.';
        isLoading = false;
      });
    }
  }

  Future<GameDetail?> fetchGameDetail(int gameId) async {
    final url = Uri.parse('http://192.168.110.57:8080/detail/game/$gameId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final List<dynamic> gameJson = decoded['gameDetail'];
      return GameDetail.fromJson(gameJson);
    } else {
      print('Failed to load game detail: ${response.statusCode}');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.navigate_before, color: mainColor, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Tìm kiếm game",
          style: TextStyle(
            color: mainColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              onChanged: _fetchGames,
              decoration: InputDecoration(
                hintText: "Nhập tên game...",
                prefixIcon: Icon(Icons.search, color: mainColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child:
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : errorMessage.isNotEmpty
                    ? Center(child: Text(errorMessage))
                    : games.isEmpty
                    ? const Center(child: Text("Không tìm thấy game nào."))
                    : ListView.builder(
                      itemCount: games.length,
                      itemBuilder: (context, index) {
                        final game = games[index];
                        return Card(
                          color: Colors.grey[100],
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            onTap: () async {
                              final gameDetail = await fetchGameDetail(game.id);
                              if (gameDetail != null && context.mounted) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ItemPage(),
                                    settings: RouteSettings(
                                      arguments: gameDetail,
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Không thể tải chi tiết game.',
                                    ),
                                  ),
                                );
                              }
                            },
                            contentPadding: const EdgeInsets.all(12),
                            leading:
                                game.images.isNotEmpty
                                    ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        game.images.first,
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                    : const Icon(Icons.videogame_asset),
                            title: Text(
                              game.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              game.description.length > 100
                                  ? "${game.description.substring(0, 100)}..."
                                  : game.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
