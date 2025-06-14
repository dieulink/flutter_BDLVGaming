import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(color: Color.fromARGB(19, 0, 0, 0)),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context); // trở về page trước
                      },
                      child: Icon(
                        Icons.navigate_before,
                        color: mainColor,
                        size: 30,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: searchController,
                                decoration: const InputDecoration(
                                  hintText: "Tìm kiếm ...",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Image.asset(
                              'assets/icons/search.png',
                              width: 20,
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Đây là nơi bạn hiển thị danh sách kết quả tìm kiếm sau này
                // Ví dụ:
                // SizedBox(
                //   height: getSizeHeight(context),
                //   child: ItemsWidget(),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
