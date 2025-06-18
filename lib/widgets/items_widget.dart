import 'dart:convert';

import 'package:app_ban_game/models/cart_item.dart';
import 'package:app_ban_game/services/bestsale_service.dart';
import 'package:app_ban_game/services/cart_service.dart';
import 'package:app_ban_game/services/game_detail_service.dart';
import 'package:app_ban_game/services/game_detail_service.dart'
    as GameDetailService;
import 'package:app_ban_game/services/item_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:app_ban_game/models/game_item.dart';
import 'package:app_ban_game/services/category_item_service.dart';
import 'package:app_ban_game/widgets/game_item_widget.dart';
import 'package:app_ban_game/widgets/categories_widget.dart';
import 'package:app_ban_game/ui_values.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  int? selectedCategoryId = 1; // CHO PHÉP NULL
  List<GameItem> _bestSellingGames = [];

  @override
  void initState() {
    super.initState();
    _fetchGames(reset: true);
    _fetchBestSellingGames();
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

  Future<void> _fetchGames({bool reset = false}) async {
    if (_isLoading) return;
    setState(() => _isLoading = true);

    try {
      final result =
          selectedCategoryId == null
              ? await ItemService.fetchGamesByCategory(
                page: _currentPage,
                categoryId: 0,
              )
              : await CategoryItemService.fetchGamesByCategory(
                page: _currentPage,
                categoryId: selectedCategoryId!,
              );

      final List<GameItem> fetchedGames = result['games'] as List<GameItem>;

      setState(() {
        if (reset) _games.clear();
        _games.addAll(fetchedGames);
        _currentPage++;
        _totalPages = result['totalPages'];
        _isLoading = false;
      });
    } catch (e) {
      print("Lỗi khi lấy game: $e");
      setState(() => _isLoading = false);
    }
  }

  void _onCategorySelected(int? categoryId) {
    setState(() {
      selectedCategoryId = categoryId;
      _currentPage = 0;
      _totalPages = 1;
    });
    _fetchGames(reset: true);
  }

  Future<void> _fetchBestSellingGames() async {
    try {
      final games = await BestSaleService.fetchBestSellingGames(
        0,
      ); // trang đầu tiên
      setState(() {
        _bestSellingGames = games;
      });
    } catch (e) {
      print('Lỗi khi lấy game bán chạy: $e');
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
              SizedBox(
                height: 160,
                child:
                    _bestSellingGames.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : PageView.builder(
                          itemCount: _bestSellingGames.length,
                          controller: PageController(viewportFraction: 1),
                          itemBuilder: (_, index) {
                            final game = _bestSellingGames[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  game.image?.isNotEmpty == true
                                      ? game.image!.replaceFirst(
                                        "t_thumb",
                                        "t_screenshot_big",
                                      )
                                      : 'assets/imgs/default.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
              ),
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
              CategoriesWidget(
                selectedCategoryId: selectedCategoryId,
                onCategorySelected: _onCategorySelected,
              ),
              MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 10,
                ),
                itemCount: _games.length,
                itemBuilder: (context, index) {
                  final game = _games[index];
                  return GameItemWidget(
                    gameName: game.name,
                    imageUrl:
                        game.image?.isNotEmpty == true
                            ? game.image!.replaceFirst(
                              "t_thumb",
                              "t_screenshot_big",
                            )
                            : 'assets/imgs/default.jpg',
                    price:
                        '${NumberFormat("#,###", "vi_VN").format(game.price)} vnđ',
                    onTap: () async {
                      final detail = await GameDetailService.fetchGameDetail(
                        game.id,
                      );
                      if (detail != null) {
                        Navigator.pushNamed(
                          context,
                          'itemPage',
                          arguments: detail,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Không thể tải chi tiết game'),
                          ),
                        );
                      }
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
