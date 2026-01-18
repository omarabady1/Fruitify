import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/widgets/show_custom_snack_bar.dart';
import 'package:fruitify/features/authentication/presentation/views/widgets/sign_up_view_body.dart';
import '../../../../../core/widgets/custom_progress_hud.dart';
import '../../../../../core/widgets/show_error_snack_bar.dart';
import '../../cubits/sign_up_cubit/sign_up_cubit.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          showCustomSnackBar(
            context,
            'تم تسجيل الحساب، برجاء العودة وتسجيل الدخول',
          );
          Navigator.pop(context);
        } else if (state is SignUpFailure) {
          showErrorSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          isLoading: state is SignUpLoading,
          child: const SignUpViewBody(),
        );
      },
    );
  }
}
