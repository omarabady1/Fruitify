import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:fruitify/generated/assets.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 73,
          height: 92,
          decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
          child: Center(
            child: SvgPicture.asset(
              Assets.imagesWatermelon,
              height: 40,
              width: 53,
            ),
          ),
        ),
        const SizedBox(width: 17),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'بطيخ',
                    style: AppTextStyles.bold13.copyWith(
                      color: const Color(0xFF06161C),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    icon: SvgPicture.asset(
                      Assets.imagesTrash,
                      height: 20,
                      width: 20,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF979899),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                '3 كم',
                style: AppTextStyles.regular13.copyWith(
                  color: const Color(0xFFF4A91F),
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _buildQuantityButton(
                        Icons.remove,
                        const Color(0xFFF3F5F7),
                        const Color(0xFF979899),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '3',
                        style: AppTextStyles.bold16.copyWith(
                          color: const Color(0xFF06140C),
                        ),
                      ),
                      const SizedBox(width: 16),
                      _buildQuantityButton(
                        Icons.add,
                        const Color(0xFF1B5E37),
                        Colors.white,
                      ),
                    ],
                  ),
                  Text(
                    '60 جنيه',
                    style: AppTextStyles.bold16.copyWith(
                      color: const Color(0xFFF4A91F),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityButton(IconData icon, Color bgColor, Color iconColor) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: Icon(icon, color: iconColor, size: 16),
          highlightColor: Colors.black12,
        ),
      ),
    );
  }
}
