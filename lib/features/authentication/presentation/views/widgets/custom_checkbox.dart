import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitify/constants.dart';
import 'package:fruitify/generated/assets.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.onChecked,
    required this.isChecked,
    this.isError = false,
  });
  final ValueChanged<bool> onChecked;
  final bool isChecked;
  final bool isError;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 24,
        height: 24,
        padding: const EdgeInsets.all(4),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: isChecked ? primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isError ? errorColor : const Color(0xFFDCDEDE),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isChecked
            ? Center(child: SvgPicture.asset(Assets.imagesCheck))
            : null,
      ),
    );
  }
}
