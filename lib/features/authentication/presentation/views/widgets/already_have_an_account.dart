import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_text_styles.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'تمتلك حساب بالفعل؟',
          style: AppTextStyles.semiBold16.copyWith(
            color: const Color(0xFF949D9E),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'تسجيل دخول',
            style: AppTextStyles.semiBold16.copyWith(color: primaryColor),
          ),
        ),
      ],
    );
  }
}
