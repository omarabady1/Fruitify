import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitify/constants.dart';
import 'package:fruitify/generated/assets.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    super.key,
    required this.onChecked,
  });
  final ValueChanged<bool> onChecked;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          widget.onChecked(isChecked);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: 24,
        height: 24,
        padding: EdgeInsets.all(4),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: isChecked ? primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.50, color: const Color(0xFFDCDEDE)),
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
