import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';

class SocialSignUpItem extends StatelessWidget {
  const SocialSignUpItem({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });
  final String label;
  final String icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        splashColor: const Color(0xFF6A976A).withValues(alpha: 0.16),
        highlightColor: const Color(0xFF6A976A).withValues(alpha: 0.13),
        onTap: onTap,
        child: Ink(
          height: 59,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 1, color: const Color(0xFFDCDEDE)),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: SvgPicture.asset(icon),
              ),
              Text(
                label,
                style: AppTextStyles.semiBold16.copyWith(
                  color: const Color(0xFF0C0D0D),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
