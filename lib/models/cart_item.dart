class CartItem {
  final int userId;
  final int gameId;

  CartItem({required this.userId, required this.gameId});

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'gameId': gameId};
  }
}
