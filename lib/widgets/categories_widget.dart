import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';
import 'package:app_ban_game/models/category_model.dart';
import 'package:app_ban_game/services/category_service.dart';

class CategoriesWidget extends StatefulWidget {
  final int? selectedCategoryId;
  final Function(int?)? onCategorySelected;

  const CategoriesWidget({
    super.key,
    required this.selectedCategoryId,
    this.onCategorySelected,
  });

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
        children: [
          // Nút "Tất cả"
          InkWell(
            onTap: () {
              widget.onCategorySelected?.call(null);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: widget.selectedCategoryId == null ? mainColor : white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.list, color: Colors.black, size: 40),
                  SizedBox(width: 5),
                  Text("Tất cả", style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),

          // Các thể loại khác
          ...categories.map((category) {
            bool isSelected = widget.selectedCategoryId == category.categoryId;

            return InkWell(
              onTap: () {
                widget.onCategorySelected?.call(category.categoryId);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? mainColor : white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imgMap[category.categoryImg] ??
                            "assets/imgs/default.png",
                        height: 40,
                        width: 50,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      category.categoryName,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
