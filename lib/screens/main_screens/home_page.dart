import 'package:app_ban_game/ui_values.dart';
import 'package:app_ban_game/widgets/categories_widget.dart';
import 'package:app_ban_game/widgets/home_app_bar.dart';
import 'package:app_ban_game/widgets/items_widget.dart';
import 'package:app_ban_game/widgets/search_game_bar.dart';
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
              color: const Color.fromARGB(19, 0, 0, 0),
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(35)
              //   topRight: Radius.circular(35)
              // )
            ),
            child: Column(
              children: [
                SearchGameBar(),

                SizedBox(height: getSizeHeight(context), child: ItemsWidget()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
