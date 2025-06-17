import 'package:flutter/material.dart';
import 'package:app_ban_game/models/cart_response_dto.dart';
import 'package:app_ban_game/services/cart_page_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CartPage extends StatefulWidget {
  final int userId;

  const CartPage({super.key, required this.userId});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Future<CartResponseDto> _cartFuture;

  @override
  void initState() {
    super.initState();
    _cartFuture = CartPageService.fetchCart(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Giỏ hàng")),
      body: FutureBuilder<CartResponseDto>(
        future: _cartFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.listgame.isEmpty) {
            return const Center(child: Text("Giỏ hàng trống"));
          }

          final cartData = snapshot.data!;
          return ListView.builder(
            itemCount: cartData.listgame.length,
            itemBuilder: (context, index) {
              final game = cartData.listgame[index];
              return ListTile(
                leading:
                    game.gameImg != null
                        ? CachedNetworkImage(
                          imageUrl: game.gameImg!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          placeholder:
                              (context, url) =>
                                  const CircularProgressIndicator(),
                          errorWidget:
                              (context, url, error) =>
                                  const Icon(Icons.broken_image),
                        )
                        : Image.asset(
                          'assets/imgs/default.jpg',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                title: Text(game.gameName),
                subtitle: Text(
                  "${game.description}\nGiá: ${game.price.toStringAsFixed(0)} VNĐ",
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: FutureBuilder<CartResponseDto>(
        future: _cartFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Tổng tiền: ${snapshot.data!.total.toStringAsFixed(0)} VNĐ",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
