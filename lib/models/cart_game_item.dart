import 'package:flutter/src/widgets/framework.dart';

class CartGameItem {
  final int gameId;
  final String gameName;
  final String? gameImg;
  final String description;
  final double price;

  CartGameItem({
    required this.gameId,
    required this.gameName,
    required this.gameImg,
    required this.description,
    required this.price,
  });

  factory CartGameItem.fromJson(Map<String, dynamic> json) {
    return CartGameItem(
      gameId: json['gameId'],
      gameName: json['gameName'],
      gameImg: json['gameImg'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
    );
  }
}
