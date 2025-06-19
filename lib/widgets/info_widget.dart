import 'package:app_ban_game/ui_values.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String value;
  final bool isPassword;
  final bool isEditable;
  final TextEditingController? controller;
  final VoidCallback? onSave;

  const InfoWidget({
    super.key,
    required this.title,
    required this.value,
    this.isPassword = false,
    this.isEditable = false,
    this.controller,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final showTextField = isEditable && controller != null;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: mainColor),
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
                showTextField
                    ? TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    )
                    : Text(
                      isPassword ? '********' : value,
                      style: const TextStyle(color: Colors.black87),
                    ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          if (isPassword)
            const Icon(Icons.remove_red_eye_outlined, color: Colors.grey),
          if (isEditable && onSave != null)
            IconButton(
              icon: const Icon(Icons.save, color: mainColor),
              onPressed: onSave,
            )
          else if (isEditable)
            const Icon(Icons.edit, color: Colors.grey),
        ],
      ),
    );
  }
}
