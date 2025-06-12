import 'package:flutter/material.dart';
import 'package:app_ban_game/ui_values.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GameItemWidget extends StatelessWidget {
  final String gameName;
  final String imageUrl;
  final String price;
  final VoidCallback onTap;

  const GameItemWidget({
    super.key,
    required this.gameName,
    required this.imageUrl,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        //padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  height: 170,
                  width: getSizeWidth(context),
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => const SizedBox(
                        height: 170,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                  errorWidget:
                      (context, url, error) => Image.asset(
                        'assets/imgs/default.jpg',
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                ),
              ),
            ),
            Container(
              //padding: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                gameName,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Padding(
              // padding: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 10,
                bottom: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.shopping_cart_checkout, color: mainColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
