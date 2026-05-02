import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_text_styles.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        foregroundColor: Color(0xff272e33),
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 4),
      ),
      child: FittedBox(
        child: Text(
          "تسوق الآن",
          style: AppTextStyles.bold13.copyWith(color: primaryColor),
        ),
      ),
    );
  }
}
