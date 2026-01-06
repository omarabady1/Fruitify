import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'custom_checkbox.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    bool isTermsAccepted = false;
    return Row(
      children: [
        CustomCheckbox(
          onChecked: (value) {
            isTermsAccepted = value;
          },
        ),
        SizedBox(width: 6),
        Expanded(
          child: Text.rich(
            softWrap: true,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: const Color(0xFF2D9F5D),
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
