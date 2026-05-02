import 'package:flutter/material.dart';
import '../../../../best_selling/presentation/views/best_selling_view.dart';

import '../../../../../core/utils/app_text_styles.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('الأكثر مبيعًا', style: AppTextStyles.bold16),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, BestSellingView.routeName);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.transparent),
            child: Text(
              'المزيد',
              style: AppTextStyles.regular13.copyWith(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
