import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruitify/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView()),
        DotsIndicator(
          dotsCount: 2,
          animate: true,
          decorator: DotsDecorator(
            activeColor: const Color(0xFF1B5E37),
            color: const Color(0xFF5DB957).withValues(alpha: 0.5),
            size: Size(9, 9),
          ),
        ),
      ],
    );
  }
}
