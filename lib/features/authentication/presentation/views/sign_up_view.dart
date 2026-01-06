import 'package:flutter/material.dart';
import 'package:fruitify/features/authentication/presentation/views/widgets/sign_up_view_body.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = 'sign_up_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'حساب جديد',),
      body: SignUpViewBody(),
    );
  }
}
