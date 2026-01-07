import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/constants.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:fruitify/features/authentication/presentation/views/widgets/sign_up_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../cubits/sign_up_cubit/sign_up_cubit.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.white,),
                  SizedBox(width: 8,),
                  Text(state.errMessage, style: AppTextStyles.semiBold16),
                ],
              ),
              backgroundColor: const Color(0xFF2E0303),
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading,
          progressIndicator: CircularProgressIndicator(color: primaryColor),
          child: const SignUpViewBody(),
        );
      },
    );
  }
}
