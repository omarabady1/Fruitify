import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/features/authentication/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruitify/features/authentication/presentation/views/widgets/sign_in_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/show_custom_snack_bar.dart';
import '../../../../../core/widgets/show_error_snack_bar.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          showCustomSnackBar(context, 'تم تسجيل الدخول بنجاح');
        } else if (state is SignInFailure) {
          showErrorSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignInLoading,
          progressIndicator: CircularProgressIndicator(color: primaryColor),
          child: const SignInViewBody(),
        );
      },
    );
  }
}
