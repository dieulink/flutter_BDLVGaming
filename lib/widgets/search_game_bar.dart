import 'package:app_ban_game/models/search_game_model.dart';
import 'package:app_ban_game/screens/main_screens/search_game_page.dart';
import 'package:app_ban_game/services/search_game_service.dart';
import 'package:flutter/material.dart';

class SearchGameBar extends StatefulWidget {
  const SearchGameBar({super.key});

  @override
  State<SearchGameBar> createState() => _SearchGameBarState();
}

class _SearchGameBarState extends State<SearchGameBar> {
  final TextEditingController _controller = TextEditingController();
  List<SearchGameModel> suggestions = [];

  void _onSearchChanged(String input) async {
    if (input.isEmpty) {
      setState(() => suggestions = []);
      return;
    }

    try {
      final result = await SearchGameService.fetchGames(input);
      setState(() => suggestions = result.take(5).toList());
    } catch (e) {
      setState(() => suggestions = []);
    }
  }

  void _goToSearchPage() {
    if (_controller.text.trim().isEmpty) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchGamePage(searchInput: _controller.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Ô tìm kiếm có bo góc + icon + padding đẹp
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.grey),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: _controller,
                  onChanged: _onSearchChanged,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Tìm kiếm game...",
                  ),
                ),
              ),
              GestureDetector(
                onTap: _goToSearchPage,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),

        // Gợi ý kết quả
        if (suggestions.isNotEmpty)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                final game = suggestions[index];
                return ListTile(
                  title: Text(game.name),
                  onTap: () {
                    _controller.text = game.name;
                    _goToSearchPage();
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}
