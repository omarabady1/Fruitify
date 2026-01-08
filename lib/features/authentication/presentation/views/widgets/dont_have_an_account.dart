import 'package:flutter/material.dart';
import 'package:fruitify/features/authentication/presentation/views/sign_up_view.dart';

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
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (states.contains(WidgetState.pressed)) {
                return primaryColor.withValues(alpha: 0.1); // splash color
              }
              return null;
            }),
          ),
          onPressed: () {
            Navigator.pushNamed(context, SignUpView.routeName);
          },
          child: Text(
            'قم بإنشاء حساب',
            style: AppTextStyles.semiBold16.copyWith(color: primaryColor),
          ),
        ),
      ],
    );
  }
}
