import 'package:app_ban_game/ui_values.dart';
import 'package:app_ban_game/widgets/item_app_bar.dart';
import 'package:flutter/material.dart';


class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              const ItemAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(
                            'assets/imgs/banSung.jpg',
                            width: double.infinity,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "-50%",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                            Text(
                              "100.000 vnđ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            )
                            ],
                          ),
                      SizedBox(height: 30,),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Game người hùng Hobiit",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Người hùng Hobbit game mô phỏng theo cuốn tiểu thuyết The Hobbit  vô cùng nổi tiếng trên toàn thế giới. Đến với game Người hùng Hobbit bạn sẽ được hóa thân vào những nhân vật như Legolas, Bard, Tauriel để chiến đấu chống lại các đợt tất công của chủng tộc tàn ác Orc. Sử dụng những cây cung là vũ khí chính của bạn hãy chiến đấu để đòi lại công bằng cho người dân Hobbit.",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: 15,),                      
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 15,),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              "Đánh giá",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: mainColor
                                ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "(5)",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: mainColor
                                  ),
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                  
                ),
              ),
                            Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                        height: 50,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Center(
                          child: Text(
                            'Thêm vào giỏ hàng',
                            style: TextStyle(
                              color: white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                   Expanded(
                    child: InkWell(
                      onTap: () {
                        
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 5, left: 5, bottom: 5),
                        height: 50,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Center(
                          child: Text(
                            'Mua ngay',
                            style: TextStyle(
                              color: white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],            
          ),
        ),
    );
  }
}