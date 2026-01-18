import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/functions/setup_service_locator.dart';
import 'package:fruitify/features/authentication/domain/repos/auth_repo.dart';
import 'package:fruitify/features/authentication/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruitify/features/authentication/presentation/views/widgets/sign_in_view_body_bloc_consumer.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const String routeName = 'login_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(locator<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل الدخول', showLeading: false),
        body: SafeArea(child: const SignInViewBodyBlocConsumer()),
      ),
    );
  }
}
