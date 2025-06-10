class CategoryModel {
  final int categoryId;
  final String categoryName;
  final String categoryImg;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImg,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['categoryId'] ?? 0,
      categoryName: json['categoryName'] ?? '',
      categoryImg: json['categoryImg'] ?? '',
    );
  }
}
