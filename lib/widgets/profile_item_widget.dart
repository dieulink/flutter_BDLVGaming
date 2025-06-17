import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';

class ProfileItemWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap; // Cho phép xử lý hành động tuỳ ý khi nhấn

  const ProfileItemWidget({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color.fromARGB(52, 206, 206, 206),
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: onTap, // sử dụng callback
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Icon(icon, size: 30, color: mainColor),
              const SizedBox(width: 20),
              Text(
                text,
                style: TextStyle(color: Colors.grey[800], fontSize: 15),
              ),
              const Spacer(),
              Icon(
                Icons.navigate_next_sharp,
                size: 30,
                color: Colors.grey[800],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
