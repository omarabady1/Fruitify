import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_text_styles.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لا تمتلك حساب؟',
          style: AppTextStyles.semiBold16.copyWith(
            color: const Color(0xFF949D9E),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'قم بإنشاء حساب',
            style: AppTextStyles.semiBold16.copyWith(color: primaryColor),
          ),
        ),
      ],
    );
  }
}