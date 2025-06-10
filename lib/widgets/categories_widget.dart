import 'package:flutter/material.dart';
import 'package:app_ban_game/models/category_model.dart';
import 'package:app_ban_game/services/category_service.dart';

class CategoriesWidget extends StatefulWidget {
  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  List<CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
    fetchCategoryData();
  }

  void fetchCategoryData() async {
    try {
      final data = await CategoryService.fetchCategories();
      setState(() {
        categories = data;
      });
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

  Map<String, String> getCategoryImageMap() {
    return {
      "banSung": "assets/imgs/theloai/bansung.png",
      "chienThuat": "assets/imgs/theloai/chienthuat.png",
      "diCanh": "assets/imgs/theloai/dicanh.png",
      "doiKhang": "assets/imgs/theloai/doikhang.png",
      "duaXe": "assets/imgs/theloai/duaxe.png",
      "giaiDo": "assets/imgs/theloai/giaido.png",
      "hanhDong": "assets/imgs/theloai/hanhdong.png",
      "kinhDi": "assets/imgs/theloai/kinhdi.png",
      "moPhong": "assets/imgs/theloai/mophong.png",
      "nhapVai": "assets/imgs/theloai/nhapvai.png",
      "phieuLuu": "assets/imgs/theloai/phieuluu.png",
      "sinhTon": "assets/imgs/theloai/sinhton.png",
      "theThao": "assets/imgs/theloai/thethao.png",
    };
  }

  @override
  Widget build(BuildContext context) {
    final imgMap = getCategoryImageMap();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            categories.map((category) {
              String imgPath =
                  imgMap[category.categoryImg] ?? "assets/imgs/default.png";
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(imgPath, height: 40, width: 50),
                    ),
                    SizedBox(width: 8),
                    Text(
                      category.categoryName,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
