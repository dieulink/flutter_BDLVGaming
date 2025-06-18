import 'dart:convert';
import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:app_ban_game/models/order_history.dart';
import 'package:app_ban_game/services/order_history_service.dart';

class ListOrderHistoryPage extends StatefulWidget {
  const ListOrderHistoryPage({super.key});

  @override
  State<ListOrderHistoryPage> createState() => _ListOrderHistoryPageState();
}

class _ListOrderHistoryPageState extends State<ListOrderHistoryPage> {
  Future<List<OrderHistory>>? _historyFuture;

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final decodeJson = prefs.getString('decode_token');

    if (decodeJson != null) {
      final decoded = jsonDecode(decodeJson);
      final userId = decoded['userId'];

      setState(() {
        _historyFuture = OrderHistoryService.fetchHistoryByUserId(userId);
      });
    } else {
      print('Không tìm thấy token!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: const Text(
          'Lịch sử mua hàng',
          style: TextStyle(
            color: mainColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        iconTheme: const IconThemeData(color: mainColor),
      ),
      body: FutureBuilder<List<OrderHistory>>(
        future: _historyFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          }

          final orders = snapshot.data;
          if (orders == null || orders.isEmpty) {
            return const Center(child: Text('Chưa có đơn hàng nào.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];

              return Card(
                color: const Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: mainColor, width: 1.2),
                ),
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 12),
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Đơn hàng #${order.orderId}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: mainColor,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text('Ngày tạo: ${order.createDate}'),
                      const SizedBox(height: 4),
                      Text(
                        'Tổng tiền: ${NumberFormat("#,###", "vi_VN").format(order.sumPrice)} vnđ',
                        style: const TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                  children:
                      order.accounts.map((acc) {
                        double rating = 0;
                        final TextEditingController commentController =
                            TextEditingController();

                        return StatefulBuilder(
                          builder: (context, setState) {
                            return Container(
                              width: getSizeWidth(context) - 20,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    acc.gamename,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text('Tài khoản: ${acc.username}'),
                                  Text('Mật khẩu: ${acc.password}'),
                                  const SizedBox(height: 10),

                                  const Text(
                                    'Đánh giá sản phẩm:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  RatingBar.builder(
                                    initialRating: rating,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 24,
                                    itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 2,
                                    ),
                                    itemBuilder:
                                        (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                    onRatingUpdate: (newRating) {
                                      setState(() {
                                        rating = newRating;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 8),

                                  TextField(
                                    controller: commentController,
                                    maxLines: 2,
                                    decoration: InputDecoration(
                                      hintText: 'Viết bình luận...',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 8,
                                          ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),

                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: mainColor,
                                      ),
                                      onPressed: () {
                                        final comment = commentController.text;
                                        if (rating == 0 || comment.isEmpty) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Vui lòng đánh giá và viết bình luận',
                                              ),
                                            ),
                                          );
                                          return;
                                        }

                                        ////
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text('Đã gửi đánh giá'),
                                          ),
                                        );

                                        setState(() {
                                          rating = 0;
                                          commentController.clear();
                                        });
                                      },
                                      child: const Text(
                                        'Gửi',
                                        style: TextStyle(color: white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
