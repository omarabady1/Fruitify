import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitify/constants.dart';
import 'package:fruitify/core/services/shared_preferences_singleton.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';

import '../../../../authentication/presentation/views/login_view.dart';

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
                  padding: const EdgeInsets.only(top: 20, right: 10),
                  child: Visibility(
                    visible: isVisible,
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: WidgetStateProperty.resolveWith<Color?>((
                          states,
                        ) {
                          if (states.contains(WidgetState.pressed)) {
                            return primaryColor.withValues(
                              alpha: 0.1,
                            ); // splash color
                          }
                          return null;
                        }),
                      ),

                      onPressed: () {
                        Prefs.setBool(isOnBoardingSeen, true);
                        Navigator.pushReplacementNamed(
                          context,
                          LoginView.routeName,
                        );
                      },
                      child: Text(
                        'تخطٍ',
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
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 24),
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
