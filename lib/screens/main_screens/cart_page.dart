import 'package:app_ban_game/ui_values.dart';
import 'package:app_ban_game/widgets/cart_app_bar.dart';
import 'package:app_ban_game/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CartAppBar(),

          Container(
            height: 540,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 245, 243, 243),
              //borderRadius: BorderRadius.circular(25),
            ),
          child: SizedBox(
              height: 500, // nhỏ hơn tí để tránh đụng padding
              child: CartItemWidget(), 
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(20) 
                  ),
                  child: Icon(
                    Icons.add,
                    color: white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    "Thêm voucher",
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey,
              ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Tổng : ",
                  style: TextStyle(
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "1000vnđ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                ),
                SizedBox(width: 15,),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Mua hàng",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: white
                          ),
                        ),
                          Text(
                          " (10)",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: white
                          ),
                        ),
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ],
        
      ),
    );
  }
}