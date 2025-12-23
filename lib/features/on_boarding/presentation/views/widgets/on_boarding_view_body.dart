import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruitify/constants.dart';
import 'package:fruitify/core/utils/custom_button.dart';
import 'package:fruitify/features/authentication/presentation/views/login_view.dart';
import 'package:fruitify/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isAnimating = false;
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController)),
        DotsIndicator(
          onTap: (index) async{
            if (isAnimating) return;
            isAnimating = true;
            await pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
            isAnimating =false;
          },
          dotsCount: 2,
          animate: true,
          decorator: DotsDecorator(
            activeColor: primaryColor,
            color: currentPage == 1
                ? primaryColor
                : const Color(0xFF5DB957).withValues(alpha: 0.5),
            size: Size(9, 9),
          ),
        ),

        Visibility(
          visible: currentPage == 1,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: CustomButton(label: 'ابدأ الآن', onPressed: () {
            Navigator.pushReplacementNamed(context, LoginView.routeName);
          }),
        ),
      ],
    );
  }
}
