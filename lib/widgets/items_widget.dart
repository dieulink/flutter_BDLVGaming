import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i=1; i<11;i++)
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          margin: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "sale",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                  ),
                  Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  )
                ],
              ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(10),
                child: Image.asset(
                  "assets/imgs/img_game_test.png",
                  height: 120,
                  width: 120,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom:8 ),
              alignment: Alignment.centerLeft,
              child: Text(
                "Title",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "description ở đâyyyyyyyyyyyyyyyy",
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 63, 63, 63),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "100vnđ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Icon(
                    Icons.shopping_cart_checkout,
                    color: mainColor,
                  )
                ],
              ),
            )
            ],
          ),
        )
      ],
      );
  }
}