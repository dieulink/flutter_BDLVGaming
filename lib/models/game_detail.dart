class GameDetail {
  final int id;
  final String name;
  final String image; // ảnh chính
  final String? description;
  final double price;
  final int quantity;
  final String releaseDate;
  final List<String> imageUrls;
  final int totalReviews;
  final double averageScore;
  final int availableAccount;

  GameDetail({
    required this.id,
    required this.name,
    required this.image,
    this.description,
    required this.price,
    required this.quantity,
    required this.releaseDate,
    required this.imageUrls,
    required this.totalReviews,
    required this.averageScore,
    required this.availableAccount,
  });

  factory GameDetail.fromJson(List<dynamic> json) {
    return GameDetail(
      id: json[0] ?? 0,
      name: json[1] ?? '',
      image: json[2] ?? '',
      description: json[3],
      price: (json[4] as num).toDouble(),
      quantity: json[5] ?? 0,
      releaseDate: json[6] ?? '',
      imageUrls:
          json[7] != null
              ? (json[7] as String)
                  .split(',')
                  .map((e) => e.trim())
                  .where((e) => e.isNotEmpty)
                  .toList()
              : [], // Trả về danh sách rỗng nếu null
      totalReviews: json[8] ?? 0,
      averageScore: json[9] != null ? (json[9] as num).toDouble() : 0.0,
      availableAccount: json[10] ?? 0,
    );
  }
}
