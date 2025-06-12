class GameItem {
  final int id;
  final String name;
  final String? image;
  final String description;
  final double price;
  final int sold;
  final String releaseDate;
  final List<String> images;

  GameItem({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.sold,
    required this.releaseDate,
    required this.images,
  });

  factory GameItem.fromList(List<dynamic> json) {
    final rawImages = json[7];
    final List<String> parsedImages =
        (rawImages is String && rawImages.isNotEmpty)
            ? rawImages.split(',').map((e) => e.trim()).toList()
            : [];

    return GameItem(
      id: json[0],
      name: json[1],
      image: parsedImages.isNotEmpty ? parsedImages[0] : null,
      description: json[3],
      price: (json[4] as num).toDouble(),
      sold: json[5],
      releaseDate: json[6],
      images: parsedImages,
    );
  }
}
