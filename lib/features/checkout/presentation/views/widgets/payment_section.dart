import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:fruitify/generated/assets.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ملخص الطلب :',
            style: AppTextStyles.bold13.copyWith(color: const Color(0xFF0C0D0D)),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFA),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'المجموع الفرعي :',
                      style: AppTextStyles.regular13.copyWith(color: const Color(0xFF616A6B)),
                    ),
                    Text(
                      '150 جنيه',
                      style: AppTextStyles.semiBold16.copyWith(color: const Color(0xFF0C0D0D)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'التوصيل :',
                      style: AppTextStyles.regular13.copyWith(color: const Color(0xFF616A6B)),
                    ),
                    Text(
                      '30 جنية',
                      style: AppTextStyles.regular13.copyWith(color: const Color(0xFF616A6B)),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Divider(color: Color(0xFFE6E9EA), height: 1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الكلي',
                      style: AppTextStyles.bold16.copyWith(color: const Color(0xFF0C0D0D)),
                    ),
                    Text(
                      '180 جنيه',
                      style: AppTextStyles.bold16.copyWith(color: const Color(0xFF0C0D0D)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'يرجي تأكيد طلبك',
            style: AppTextStyles.bold13.copyWith(color: const Color(0xFF0C0D0D)),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFA),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'وسيلة الدفع',
                      style: AppTextStyles.bold13.copyWith(color: const Color(0xFF0C0D0D)),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            'تعديل',
                            style: AppTextStyles.regular13.copyWith(color: const Color(0xFF949D9E)),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.edit, size: 16, color: Color(0xFF949D9E)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 26,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1434CB),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: SvgPicture.asset(Assets.imagesVisa, width: 26),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '**** **** **** 6522',
                      style: AppTextStyles.regular13.copyWith(color: const Color(0xFF616A6B)),
                      textDirection: TextDirection.ltr,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'عنوان التوصيل',
                      style: AppTextStyles.bold13.copyWith(color: const Color(0xFF0C0D0D)),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            'تعديل',
                            style: AppTextStyles.regular13.copyWith(color: const Color(0xFF949D9E)),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.edit, size: 16, color: Color(0xFF949D9E)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 20, color: Color(0xFF0C0D0D)),
                    const SizedBox(width: 8),
                    Text(
                      'شارع النيل، مبنى رقم 123',
                      style: AppTextStyles.regular13.copyWith(color: const Color(0xFF616A6B)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
