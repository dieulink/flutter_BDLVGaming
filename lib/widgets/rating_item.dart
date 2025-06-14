import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/review_model.dart';
import '../ui_values.dart';

class RatingItem extends StatelessWidget {
  final List<ReviewModel> reviews;

  const RatingItem({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text("Chưa có đánh giá nào.", style: TextStyle(fontSize: 14)),
      );
    }

    return Column(
      children:
          reviews.map((review) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.userName,
                  style: TextStyle(
                    color: black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                RatingBarIndicator(
                  rating: review.score,
                  itemBuilder:
                      (context, _) =>
                          const Icon(Icons.star, color: Colors.amber),
                  itemCount: 5,
                  itemSize: 15.0,
                  direction: Axis.horizontal,
                ),
                Text(
                  review.comment,
                  style: TextStyle(fontSize: 13, color: black),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  height: 1,
                  color: const Color.fromARGB(150, 158, 158, 158),
                ),
              ],
            );
          }).toList(),
    );
  }
}
