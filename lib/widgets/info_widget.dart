import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String value;
  final bool isPassword;

  const InfoWidget({
    super.key,
    required this.title,
    required this.value,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  isPassword ? '********' : value,
                  style: const TextStyle(color: Colors.black87),
                ),
              ],
            ),
          ),
          if (isPassword)
            Icon(Icons.remove_red_eye_outlined, color: Colors.grey),
          const SizedBox(width: 8),
          Icon(Icons.edit, color: Colors.grey),
        ],
      ),
    );
  }
}
