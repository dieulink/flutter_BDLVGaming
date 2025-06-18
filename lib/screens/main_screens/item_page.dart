import 'dart:convert';
import 'package:app_ban_game/models/cart_item.dart';
import 'package:app_ban_game/models/game_detail.dart';
import 'package:app_ban_game/models/review_model.dart';
import 'package:app_ban_game/services/cart_service.dart';
import 'package:app_ban_game/services/review_service.dart';
import 'package:app_ban_game/ui_values.dart';
import 'package:app_ban_game/widgets/item_app_bar.dart';
import 'package:app_ban_game/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  late GameDetail game;
  late String currentImage;
  List<ReviewModel> reviewList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    game = ModalRoute.of(context)!.settings.arguments as GameDetail;
    currentImage = game.imageUrls.isNotEmpty ? game.imageUrls.first : '';
    fetchReviews(); // Gọi API khi mở trang
  }

  Future<void> fetchReviews() async {
    try {
      final reviews = await ReviewService().getReviews(game.id, 0);
      setState(() {
        reviewList = reviews;
      });
    } catch (e) {
      print('Error fetching reviews: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          children: [
            const ItemAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      currentImage.replaceFirst("t_thumb", "t_screenshot_big"),
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => Image.asset(
                            'assets/imgs/default.jpg',
                            width: double.infinity,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                    ),
                    const SizedBox(height: 10),
                    // Danh sách ảnh nhỏ
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: game.imageUrls.length,
                        itemBuilder: (context, index) {
                          final imageUrl = game.imageUrls[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentImage = imageUrl;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      currentImage == imageUrl
                                          ? mainColor
                                          : Colors.grey.shade300,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  imageUrl,
                                  width: 90,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          '${NumberFormat("#,###", "vi_VN").format(game.price)}',
                          style: const TextStyle(
                            color: mainColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          " vnđ",
                          style: TextStyle(color: mainColor, fontSize: 12),
                        ),
                        const Spacer(),
                        Text(
                          "Còn ${game.availableAccount} tài khoản",
                          style: const TextStyle(
                            color: Color.fromARGB(118, 0, 0, 0),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        game.name,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      game.description ?? 'Không có mô tả',
                      style: const TextStyle(fontSize: 13),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 15),
                    Container(height: 1, color: Colors.grey),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text(
                          "Đánh giá",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: mainColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "(${game.totalReviews})",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: mainColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        RatingBarIndicator(
                          rating: game.averageScore,
                          itemBuilder:
                              (context, index) =>
                                  const Icon(Icons.star, color: Colors.amber),
                          itemCount: 5,
                          itemSize: 30.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                    RatingItem(reviews: reviewList),
                  ],
                ),
              ),
            ),
            // Nút mua hàng giữ nguyên
            Row(
              children: [
                const Spacer(),
                Expanded(
                  child: InkWell(
                    onTap:
                        game.availableAccount == 0
                            ? null
                            : () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              final decoded = prefs.getString('decode_token');

                              if (decoded != null) {
                                final map = jsonDecode(decoded);
                                final userId = map['userId'];
                                final cartItem = CartItem(
                                  userId: userId,
                                  gameId: game.id,
                                );

                                final result = await CartService.addToCart(
                                  cartItem,
                                );

                                if (result == -1) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Game đã có trong giỏ hàng',
                                      ),
                                    ),
                                  );
                                } else if (result != null) {
                                  Navigator.pushNamed(context, 'cartPage');
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Thêm vào giỏ hàng thất bại',
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 5,
                        right: 5,
                        bottom: 20,
                      ),
                      height: 50,
                      decoration: BoxDecoration(
                        color:
                            game.availableAccount == 0
                                ? Colors.grey.shade400
                                : mainColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Text(
                          'Thêm vào giỏ hàng',
                          style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap:
                        game.availableAccount == 0
                            ? null
                            : () {
                              // logic mua ngay
                            },
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 5,
                        left: 5,
                        bottom: 20,
                      ),
                      height: 50,
                      decoration: BoxDecoration(
                        color:
                            game.availableAccount == 0
                                ? Colors.grey.shade400
                                : mainColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Text(
                          'Mua ngay',
                          style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
