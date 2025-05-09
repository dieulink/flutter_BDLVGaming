import 'package:app_ban_game/ui_values.dart';
import 'package:app_ban_game/widgets/categories_widget.dart';
import 'package:app_ban_game/widgets/home_app_bar.dart';
import 'package:app_ban_game/widgets/items_widget.dart';
import 'package:flutter/material.dart';

// File: home_page.dart

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView( 
        
        children: [
        HomeAppBar(),
        Container(
          //height: getSizeHeight(context)*0.8,
          padding: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 245, 243, 243),
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(35),
            //   topRight: Radius.circular(35)
            // )
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 50,
                      width: getSizeWidth(context) *0.7,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Tìm kiếm ..."
                        ),
                      )
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/icons/search.png',
                      width: 20,
                      height: 20,
                    )
                  ],
                ),
              ),
              Container(
                margin:EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: 5,
                    controller: PageController(
                      viewportFraction: 1, 
                      initialPage: 0,
                    ),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/imgs/theThao.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Text(
                  "Thể loại",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: mainColor
                  ), 
                  ),
              ),
              CategoriesWidget(),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Text(
                  "Game hot !",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: mainColor
                  ), 
                  ),
              ),
              ItemsWidget(),
            ],
          ),
        )
        ],
      ),
    );
  }
} 