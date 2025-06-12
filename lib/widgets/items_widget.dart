import 'package:app_ban_game/ui_values.dart';
import 'package:app_ban_game/widgets/categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:app_ban_game/models/game_item.dart';
import 'package:app_ban_game/services/item_service.dart';
import 'package:app_ban_game/widgets/game_item_widget.dart';

class ItemsWidget extends StatefulWidget {
  const ItemsWidget({super.key});

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  final ScrollController _scrollController = ScrollController();
  List<GameItem> _games = [];
  int _currentPage = 0;
  int _totalPages = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchGames();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoading &&
        _currentPage < _totalPages - 1) {
      _fetchGames();
    }
  }

  Future<void> _fetchGames() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });

    try {
      final result = await ItemService.fetchGames(page: _currentPage);
      final List<GameItem> fetchedGames = result['games'] as List<GameItem>;
      final int totalPages = result['totalPages'];

      setState(() {
        _games.addAll(fetchedGames);
        _currentPage++;
        _totalPages = totalPages;
        _isLoading = false;
      });
    } catch (e) {
      print("Lỗi khi lấy game: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _games.isEmpty && _isLoading
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // Banner
              Container(
                //margin: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 160,
                  child: PageView.builder(
                    itemCount: 5,
                    controller: PageController(
                      viewportFraction: 1,
                      initialPage: 0,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          //vertical: 10,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/imgs/theThao.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Tiêu đề "Thể loại"
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                child: Text(
                  "Thể loại",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                  ),
                ),
              ),

              // Widget thể loại
              CategoriesWidget(),

              // // Tiêu đề "Game hot"
              // Container(
              //   alignment: Alignment.centerLeft,
              //   margin: const EdgeInsets.symmetric(
              //     vertical: 20,
              //     horizontal: 20,
              //   ),
              //   child: Text(
              //     "Game hot !",
              //     style: TextStyle(
              //       fontSize: 21,
              //       fontWeight: FontWeight.bold,
              //       color: mainColor,
              //     ),
              //   ),
              // ),

              // Danh sách game dạng grid
              MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                shrinkWrap: true, // Quan trọng
                physics: const NeverScrollableScrollPhysics(), // Quan trọng
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                itemCount: _games.length,
                itemBuilder: (context, index) {
                  final game = _games[index];
                  return GameItemWidget(
                    gameName: game.name,
                    imageUrl:
                        game.image?.isNotEmpty == true
                            ? game.image!
                            : 'https://via.placeholder.com/200',
                    price: '${game.price.toStringAsFixed(0)} vnđ',
                    onTap: () {
                      Navigator.pushNamed(context, 'itemPage', arguments: game);
                    },
                  );
                },
              ),

              if (_isLoading)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
