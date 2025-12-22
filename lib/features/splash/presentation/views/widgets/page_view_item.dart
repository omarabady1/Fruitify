import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.subtitle,
    required this.isVisible,
  });
  final String image, backgroundImage;
  final Widget title;
  final String subtitle;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Stack(
            alignment: AlignmentGeometry.bottomCenter,
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              SvgPicture.asset(image),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(top: 20, right: 10),
                  child: TextButton(
                    onPressed: () {},
                    child: Visibility(
                      visible: isVisible,
                      child: Text(
                        'تخطٍ',
                        // style: GoogleFonts.cairo(
                        //   color: const Color(0xFF949D9E),
                        //   fontSize: 13,
                        //   fontWeight: FontWeight.w600,
                        //   height: 1.70,
                        // ),
                        style: AppTextStyles.semiBold13.copyWith(
                          color: const Color(0xFF949D9E),
                          height: 1.70,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 64),
        title,
        SizedBox(height: 24),
        SizedBox(
          width: 301,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold13.copyWith(
              height: 1.7,
              color: const Color(0xFF4E5556),
            ),
          ),
        ),
      ],
    );
  }
}
