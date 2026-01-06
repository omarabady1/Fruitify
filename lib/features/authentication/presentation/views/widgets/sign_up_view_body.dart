import 'package:flutter/material.dart';
import 'package:fruitify/features/authentication/presentation/views/widgets/already_have_an_account.dart';
import 'package:fruitify/features/authentication/presentation/views/widgets/terms_and_condition.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 24),
            CustomTextField(hint: 'الاسم بالكامل'),
            SizedBox(height: 16),
            CustomTextField(
              hint: 'البريد الإلكتروني',
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomTextField(hint: 'كلمة المرور', isPassword: true),
            SizedBox(height: 16),

            TermsAndConditions(),

            SizedBox(height: 30),
            CustomButton(label: 'إنشاء حساب جديد', onPressed: () {}),
            SizedBox(height: 26),
            AlreadyHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
