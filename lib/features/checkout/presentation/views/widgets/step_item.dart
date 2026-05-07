import 'package:flutter/material.dart';
import 'package:fruitify/constants.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';

class StepItem extends StatelessWidget {
  const StepItem({
    super.key,
    required this.text,
    required this.index,
    required this.isActive,
  });

  final String text;
  final int index;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 23,
          height: 23,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? primaryColor : const Color(0xFFF2F3F3),
          ),
          child: Center(
            child: isActive
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : Text(
                    index.toString(),
                    style: AppTextStyles.semiBold13.copyWith(
                      color: const Color(0xFF0C0D0D),
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 4),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: isActive
              ? AppTextStyles.bold13.copyWith(color: primaryColor)
              : AppTextStyles.semiBold13.copyWith(
                  color: const Color(0xFFAAAAAA),
                ),
          child: Text(text),
        ),
      ],
    );
  }
}
