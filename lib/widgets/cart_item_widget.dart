import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';
import 'package:app_ban_game/models/cart_game_item.dart';
import 'package:app_ban_game/models/cart_item.dart';
import 'package:app_ban_game/services/delete_cart_service.dart';
import 'package:intl/intl.dart';

class CartItemWidget extends StatelessWidget {
  final List<CartGameItem> gameList;
  final int userId;
  final VoidCallback onRefresh;
  final Function(double)? onTotalChanged;

  const CartItemWidget({
    super.key,
    required this.gameList,
    required this.userId,
    required this.onRefresh,
    this.onTotalChanged,
  });

  Widget buildImage(String? url) {
    if (url != null && url.startsWith("http")) {
      return Image.network(
        url,
        width: 80,
        height: 60,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            "assets/imgs/default.jpg",
            width: 80,
            height: 60,
            fit: BoxFit.cover,
          );
        },
      );
    } else {
      return Image.asset(
        "assets/imgs/default.jpg",
        width: 80,
        height: 60,
        fit: BoxFit.cover,
      );
    }
  }

  Future<void> _handleDelete(BuildContext context, int gameId) async {
    final item = CartItem(userId: userId, gameId: gameId);
    final result = await DeleteCartService.deleteCart(item);

    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã xóa sản phẩm khỏi giỏ hàng')),
      );
      onRefresh(); // Gọi lại API để cập nhật UI
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Xóa thất bại!')));
    }
  }

  void _notifyTotal() {
    if (onTotalChanged != null) {
      double total = 0;
      for (var game in gameList) {
        total += game.price;
      }
      onTotalChanged!(total);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _notifyTotal());

    return ListView.builder(
      itemCount: gameList.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        final game = gameList[index];

        return Container(
          height: 110,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 226, 226, 226), // nền trắng
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromARGB(144, 0, 176, 215),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
            ],
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: buildImage(game.gameImg),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      game.gameName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${NumberFormat("#,###", "vi_VN").format(game.price)} vnđ",
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () => _handleDelete(context, game.gameId),
              ),
            ],
          ),
        );
      },
    );
  }
}
