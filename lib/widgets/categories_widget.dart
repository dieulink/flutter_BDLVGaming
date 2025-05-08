import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget{

  final List<Map<String, String>> category = [
     {"imagePath": "assets/imgs/banSung.jpg", "title": "Bắn súng"},
     {"imagePath": "assets/imgs/chienThuat.jpg", "title": "Chiến thuật"},
     {"imagePath": "assets/imgs/diCanh.jpg", "title": "Đi canh"},
     {"imagePath": "assets/imgs/doiKhang.jpg", "title": "Đối kháng"},
     {"imagePath": "assets/imgs/duaXe.jpg", "title": "Đua xe"},
     {"imagePath": "assets/imgs/giaiDo.jpg", "title": "Giải đố"},
     {"imagePath": "assets/imgs/hanhDong.jpg", "title": "Hành động"},
     {"imagePath": "assets/imgs/kinhDi.jpg", "title": "Kinh dị"},
     {"imagePath": "assets/imgs/moPhong.jpg", "title": "Mô phỏng"},
     {"imagePath": "assets/imgs/nhapVai.jpg", "title": "Nhập vai"},
     {"imagePath": "assets/imgs/phieuLuu.jpg", "title": "Phiêu lưu"},
     {"imagePath": "assets/imgs/sinhTon.jpg", "title": "Sinh tồn"},
     {"imagePath": "assets/imgs/theThao.jpg", "title": "Thể thao"},
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: category.map((category){ //lặp qua danh sách category, mỗi phần tử là 1 map
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    category["imagePath"]!,
                    height: 60,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  category["title"]!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: mainColor,
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}