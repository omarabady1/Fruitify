import 'package:flutter/material.dart';
import 'package:fruitify/constants.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.onPressed});
  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 43, top: 29),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          foregroundColor: Color(0xff272e33)
        ),
        child: SizedBox(
          height: 54,
          child: Center(
            child: Text(
              label,
              style: AppTextStyles.bold16.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
