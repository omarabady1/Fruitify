import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'custom_checkbox.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
    this.onChecked,
    required this.termsKey,
    this.isChecked = false,
  });
  final ValueChanged<bool>? onChecked;
  final GlobalKey<FormFieldState<bool>> termsKey;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      key: termsKey,
      initialValue: isChecked,
      validator: (value) {
        if (value == null || !value) {
          return 'يجب الموافقة على الشروط والأحكام';
        }
        return null;
      },
      builder: (state) {
        return Row(
          children: [
            CustomCheckbox(
              isChecked: state.value ?? false,
              isError: state.hasError,
              onChecked: (value) {
                state.didChange(value);
                onChecked?.call(value);
              },
            ),
            const SizedBox(width: 6),
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
      },
    );
  }
}
