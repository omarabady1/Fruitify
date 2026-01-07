import 'package:flutter/material.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:fruitify/core/widgets/custom_button.dart';
import 'package:fruitify/core/widgets/custom_text_field.dart';
import 'package:fruitify/features/authentication/presentation/views/widgets/social_login_button.dart';
import 'package:fruitify/generated/assets.dart';

import 'dont_have_an_account.dart';
import 'or_divider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 24),
            CustomTextField(
              hint: 'البريد الإلكتروني',
              inputType: TextInputType.emailAddress,
              onSaved: (value) {},
            ),
            SizedBox(height: 16),
            CustomTextField(
              hint: 'كلمة المرور',
              isPassword: true,
              onSaved: (value) {},
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: Text(
                'نسيت كلمة المرور؟',
                style: AppTextStyles.semiBold13.copyWith(
                  color: const Color(0xFF2D9F5D),
                ),
              ),
            ),
            SizedBox(height: 33),
            CustomButton(label: 'تسجيل دخول', onPressed: () {}),
            SizedBox(height: 33),
            DontHaveAnAccountWidget(),
            SizedBox(height: 33),
            OrDivider(),
            SizedBox(height: 16),
            SocialSignUpItem(
              label: 'تسجيل بواسطة جوجل',
              icon: Assets.imagesGoogleIcon,
              onTap: () {},
            ),
            SizedBox(height: 16),
            SocialSignUpItem(
              label: 'تسجيل بواسطة أبل',
              icon: Assets.imagesAppleIcon,
              onTap: () {},
            ),
            SizedBox(height: 16),
            SocialSignUpItem(
              label: 'تسجيل بواسطة فيسبوك',
              icon: Assets.imagesFacebookIcon,
              onTap: () {},
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
