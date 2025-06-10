import 'dart:convert';
import 'package:app_ban_game/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  static Future<List<CategoryModel>> fetchCategories() async {
    final url = Uri.parse('http://192.168.5.136:8080/home/categories');
    final response = await http.get(url);

    print('API body: ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => CategoryModel.fromJson(item)).toList();
    } else {
      throw Exception('load categories không thành công');
    }
  }
}
