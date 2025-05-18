import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingItem extends StatelessWidget {
  const RatingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Nguyễn Văn A",
              style: TextStyle(
                color: black,
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: RatingBarIndicator(
              rating: 5, 
              itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.amber,
                ),
              itemCount: 5, 
              itemSize: 15.0, 
              direction: Axis.horizontal, 
                              ),
          ), 
          Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Game này hay quáaaaaaaaaa",
              style: TextStyle(
                fontSize: 13,
                color: black
              ),
            ),
          ),
          Container(
            height: 1,
            color: const Color.fromARGB(150, 158, 158, 158),
              ),         
        ],
      ),
    );
  }
}