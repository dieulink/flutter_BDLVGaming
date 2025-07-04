import 'dart:convert';
import 'package:app_ban_game/models/add_order_request.dart';
import 'package:app_ban_game/models/cart_item.dart';
import 'package:app_ban_game/screens/main_screens/home_tab.dart';
import 'package:app_ban_game/services/delete_cart_service.dart';
import 'package:app_ban_game/services/order_service.dart';
import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_ban_game/models/cart_response_dto.dart';
import 'package:app_ban_game/services/cart_page_service.dart';
import 'package:app_ban_game/widgets/cart_app_bar.dart';
import 'package:app_ban_game/widgets/cart_item_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Future<CartResponseDto>? _cartFuture;
  int? _userId;
  double _totalPrice = 0;

  @override
  void initState() {
    super.initState();
    _loadCart();
  }

  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final decodeJson = prefs.getString('decode_token');

    if (decodeJson != null) {
      final decoded = jsonDecode(decodeJson);
      final userId = decoded['userId'];

      setState(() {
        _userId = userId;
        _cartFuture = CartPageService.fetchCart(userId);
      });
    } else {
      print('Không tìm thấy token!');
    }
  }

  void _handleTotalChanged(double total) {
    setState(() {
      _totalPrice = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CartAppBar(),
      body: FutureBuilder<CartResponseDto>(
        future: _cartFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Giỏ hàng trống'));
          }

          if (!snapshot.hasData || snapshot.data!.listgame.isEmpty) {
            return const Center(child: Text('Giỏ hàng trống'));
          }

          final cart = snapshot.data!;
          return Column(
            children: [
              Expanded(
                child: CartItemWidget(
                  gameList: cart.listgame,
                  userId: _userId!,
                  onRefresh: _loadCart,
                  onTotalChanged: _handleTotalChanged,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tổng: ${NumberFormat("#,###", "vi_VN").format(_totalPrice)} vnđ",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: red,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_userId != null && snapshot.data != null) {
                          final cart = snapshot.data!;
                          final gameIds =
                              cart.listgame.map((game) => game.gameId).toList();

                          final order = AddOrderRequest(
                            userId: _userId!,
                            sumPrice: _totalPrice,
                            gameIds: gameIds,
                          );

                          try {
                            final success = await OrderService.addOrder(order);
                            if (success) {
                              for (var item in cart.listgame) {
                                await DeleteCartService.deleteCart(
                                  CartItem(
                                    userId: _userId!,
                                    gameId: item.gameId,
                                  ),
                                );
                              }

                              if (!mounted) return;

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const HomeTab(index: 1),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Đặt hàng thất bại'),
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Lỗi khi đặt hàng: $e')),
                            );
                          }
                        }
                      },

                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 5,
                          left: 5,
                          bottom: 20,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 50,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Center(
                          child: Text(
                            'Thanh toán',
                            style: TextStyle(
                              color: white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
