import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';

import '../../../../../generated/assets.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onFilterTap;
  final VoidCallback? onSearchTap;
  final Function(String)? onChanged;

  const CustomSearchField({
    super.key,
    this.controller,
    this.onFilterTap,
    this.onSearchTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        cursorColor: Colors.black45,
        style: AppTextStyles.semiBold16,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: 'أبحث عن....',
          hintStyle: AppTextStyles.semiBold13.copyWith(
            color: const Color(0xFF949D9E),
          ),
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          suffixIcon: SizedBox(
            width: 20,
            child: Center(child: SvgPicture.asset(Assets.imagesSetting4)),
          ),
          prefixIcon: SizedBox(
            width: 20,
            child: Center(child: SvgPicture.asset(Assets.imagesSearchNormal)),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1),
      borderRadius: BorderRadius.circular(4),
    );
  }
}
