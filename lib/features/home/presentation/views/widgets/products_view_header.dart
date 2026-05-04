import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:fruitify/generated/assets.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('منتجاتنا', style: AppTextStyles.bold16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: const Color(0xFFCACECE).withValues(alpha: 0.4),
            ),
          ),
          child: SvgPicture.asset(
            Assets.imagesArrowSwapVertical,
            height: 20,
            width: 20,
          ),
        ),
      ],
    );
  }
}
