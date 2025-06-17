import 'package:app_ban_game/models/game_item.dart';
import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final List<GameItem> gameList;

  const CartItemWidget({super.key, required this.gameList});

  Widget buildImage(String? url) {
    if (url != null && url.startsWith("http")) {
      return Image.network(
        url,
        width: 80,
        height: 60,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            "assets/imgs/default.jpg",
            width: 80,
            height: 60,
            fit: BoxFit.cover,
          );
        },
      );
    } else {
      return Image.asset(
        "assets/imgs/default.jpg",
        width: 80,
        height: 60,
        fit: BoxFit.cover,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gameList.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        final game = gameList[index];

        return Container(
          height: 110,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Radio(
                value: game.id,
                groupValue: null,
                onChanged: (_) {},
                activeColor: mainColor,
              ),
              Container(
                margin: const EdgeInsets.only(right: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: buildImage(game.image),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        game.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "${game.price.toStringAsFixed(0)} vnđ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.delete_outline, color: Colors.red),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const Icon(CupertinoIcons.minus, size: 15),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            game.sold.toString(),
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const Icon(CupertinoIcons.plus, size: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
