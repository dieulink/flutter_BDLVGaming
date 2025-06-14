class SearchGameModel {
  final int id;
  final String name;
  final String? category;
  final String description;
  final double price;
  final int sale;
  final String releaseDate;
  final List<String> images;

  SearchGameModel({
    required this.id,
    required this.name,
    this.category,
    required this.description,
    required this.price,
    required this.sale,
    required this.releaseDate,
    required this.images,
  });

  factory SearchGameModel.fromJson(List<dynamic> json) {
    return SearchGameModel(
      id: json[0],
      name: json[1],
      category: json[2],
      description: json[3],
      price: json[4].toDouble(),
      sale: json[5],
      releaseDate: json[6],
      images: (json[7] as String).split(', ').toList(),
    );
  }
}
