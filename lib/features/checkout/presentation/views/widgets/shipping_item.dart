import 'package:flutter/material.dart';
import 'package:fruitify/constants.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subtext,
    required this.price,
    required this.isActive,
  });

  final String title;
  final String subtext;
  final String price;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 16, right: 28, left: 13),
      decoration: BoxDecoration(
        color: const Color(0x33D9D9D9),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: isActive ? primaryColor : Colors.transparent),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(
                isActive
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: isActive ? primaryColor : Colors.grey,
                size: 18,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.semiBold13.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtext,
                    style: AppTextStyles.regular13.copyWith(
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                price,
                style: AppTextStyles.bold13.copyWith(
                  color: const Color(0xFF3A8B33),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
