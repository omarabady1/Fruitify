import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:fruitify/core/widgets/custom_button.dart';
import 'package:fruitify/core/widgets/custom_text_field.dart';
import 'package:fruitify/features/authentication/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruitify/features/authentication/presentation/views/widgets/social_login_button.dart';
import 'package:fruitify/generated/assets.dart';

import '../../../../../constants.dart';
import 'dont_have_an_account.dart';
import 'or_divider.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late String email, password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 24),
              CustomTextField(
                hint: 'البريد الإلكتروني',
                inputType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hint: 'كلمة المرور',
                isPassword: true,
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 8),
              TextButton(
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.resolveWith<Color?>((
                    states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return primaryColor.withValues(
                        alpha: 0.1,
                      ); // splash color
                    }
                    return null;
                  }),
                ),
                onPressed: () {},
                child: Text(
                  'نسيت كلمة المرور؟',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: const Color(0xFF2D9F5D),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              CustomButton(
                label: 'تسجيل دخول',
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SignInCubit>().signIn(email, password);
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 24),
              DontHaveAnAccountWidget(),
              const SizedBox(height: 18),
              OrDivider(),
              const SizedBox(height: 16),
              SocialSignUpItem(
                label: 'تسجيل بواسطة جوجل',
                icon: Assets.imagesGoogleIcon,
                onTap: () {},
              ),
              const SizedBox(height: 16),
              SocialSignUpItem(
                label: 'تسجيل بواسطة أبل',
                icon: Assets.imagesAppleIcon,
                onTap: () {},
              ),
              const SizedBox(height: 16),
              SocialSignUpItem(
                label: 'تسجيل بواسطة فيسبوك',
                icon: Assets.imagesFacebookIcon,
                onTap: () {},
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
