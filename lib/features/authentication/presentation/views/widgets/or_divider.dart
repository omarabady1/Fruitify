import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: AlignmentGeometry.center,
        children: [Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: const Color(0xFFDCDEDE),
              ),
            ),
          ),
        ),
          Container(
            width: 55.59,
            height: 31,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(child: Text('أو', style: AppTextStyles.semiBold16.copyWith(color: const Color(0xFF0C0D0D)),)),
          )
        ]
    );
  }
}