class CartGameItem {
  final int gameId;
  final String gameName;
  final String? gameImg;
  final String description;
  final double price;
  final int quantity;
  final String createDate;

  CartGameItem({
    required this.gameId,
    required this.gameName,
    required this.gameImg,
    required this.description,
    required this.price,
    required this.quantity,
    required this.createDate,
  });

  factory CartGameItem.fromJson(Map<String, dynamic> json) {
    return CartGameItem(
      gameId: json['gameId'],
      gameName: json['gameName'],
      gameImg: json['gameImg'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      createDate: json['createDate'],
    );
  }

  get releaseDate => null;

  get id => null;

  get name => null;

  get image => null;
}
