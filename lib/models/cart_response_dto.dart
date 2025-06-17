import 'cart_game_item.dart'; // import file chứa CartGameItem

class CartResponseDto {
  final List<CartGameItem> listgame;
  final double total;

  CartResponseDto({required this.listgame, required this.total});

  factory CartResponseDto.fromJson(Map<String, dynamic> json) {
    final gamesJson = json['listgame'] as List;
    return CartResponseDto(
      listgame: gamesJson.map((e) => CartGameItem.fromJson(e)).toList(),
      total: (json['total'] as num).toDouble(),
    );
  }
}
