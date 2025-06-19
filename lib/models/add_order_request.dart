class AddOrderRequest {
  final int userId;
  final double sumPrice;
  final List<int> gameIds;

  AddOrderRequest({
    required this.userId,
    required this.sumPrice,
    required this.gameIds,
  });

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'sumPrice': sumPrice.toInt(), 'gameIds': gameIds};
  }
}
