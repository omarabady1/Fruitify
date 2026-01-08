import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/app_text_styles.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.white),
          const SizedBox(width: 8),
          Flexible(child: Text(text, style: AppTextStyles.semiBold16)),
        ],
      ),
      backgroundColor: errorColor,
    ),
  );
}
