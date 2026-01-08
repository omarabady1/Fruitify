import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/features/authentication/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruitify/features/authentication/presentation/views/widgets/already_have_an_account.dart';
import 'package:fruitify/features/authentication/presentation/views/widgets/terms_and_condition.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String name, email, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 24),
              CustomTextField(
                hint: 'الاسم بالكامل',
                onSaved: (value) {
                  name = value!;
                },
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),

              TermsAndConditions(),

              const SizedBox(height: 30),
              CustomButton(
                label: 'إنشاء حساب جديد',
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SignUpCubit>().createUserWithEmailAndPassword(
                      email,
                      password,
                      name,
                    );
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 26),
              AlreadyHaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
