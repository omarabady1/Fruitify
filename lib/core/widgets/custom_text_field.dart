import 'package:flutter/material.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.inputType = TextInputType.text,
  });
  final String hint;
  final bool isPassword;
  final TextInputType inputType;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black45,
      style: AppTextStyles.semiBold16,
      keyboardType: widget.inputType,
      obscureText: widget.isPassword ? !showPassword : false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        fillColor: const Color(0xFFF9FAFA),
        filled: true,
        hintText: widget.hint,
        hintStyle: AppTextStyles.bold13.copyWith(
          color: const Color(0xFF949D9E),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFE6E9E9), width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFE6E9E9), width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: showPassword
                    ? Icon(Icons.visibility_off_rounded)
                    : Icon(Icons.visibility_rounded),
                color: const Color(0xffC9CECF),
              )
            : null,
      ),
    );
  }
}
