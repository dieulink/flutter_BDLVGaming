import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget{

  final List<Map<String, String>> category = [
     {"imagePath": "assets/imgs/theloai/bansung.png", "title": "Bắn súng"},
     {"imagePath": "assets/imgs/theloai/chienthuat.png", "title": "Chiến thuật"},
     {"imagePath": "assets/imgs/theloai/dicanh.png", "title": "Đi canh"},
     {"imagePath": "assets/imgs/theloai/doikhang.png", "title": "Đối kháng"},
     {"imagePath": "assets/imgs/theloai/duaxe.png", "title": "Đua xe"},
     {"imagePath": "assets/imgs/theloai/giaido.png", "title": "Giải đố"},
     {"imagePath": "assets/imgs/theloai/hanhdong.png", "title": "Hành động"},
     {"imagePath": "assets/imgs/theloai/kinhdi.png", "title": "Kinh dị"},
     {"imagePath": "assets/imgs/theloai/mophong.png", "title": "Mô phỏng"},
     {"imagePath": "assets/imgs/theloai/nhapvai.png", "title": "Nhập vai"},
     {"imagePath": "assets/imgs/theloai/phieuluu.png", "title": "Phiêu lưu"},
     {"imagePath": "assets/imgs/theloai/sinhton.png", "title": "Sinh tồn"},
     {"imagePath": "assets/imgs/theloai/thethao.png", "title": "Thể thao"},
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    category["imagePath"]!,
                    height: 40,
                    width: 50,
                    //fit: BoxFit.cover,
                  ),
                ),
                Text(
                  category["title"]!,
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: black,
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