import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/functions/setup_service_locator.dart';
import 'package:fruitify/features/authentication/domain/repos/auth_repo.dart';
import 'package:fruitify/features/authentication/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruitify/features/authentication/presentation/views/widgets/sign_up_view_body_bloc_consumer.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const String routeName = 'sign_up_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(locator<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'حساب جديد'),
        body: SafeArea(child: const SignUpViewBodyBlocConsumer()),
      ),
    );
  }
}
