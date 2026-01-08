import 'package:flutter/material.dart';
import 'package:fruitify/features/authentication/presentation/views/widgets/login_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'تسجيل الدخول', showLeading: false),
      body: SafeArea(child: LoginViewBody()),
    );
  }
}
