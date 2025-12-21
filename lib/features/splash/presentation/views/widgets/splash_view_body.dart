import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitify/features/on_boarding/presentation/views/on_boarding_view.dart';

import '../../../../../generated/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> topAnim;
  late Animation<double> logoAnim;
  late Animation<double> bottomAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    bottomAnim = Tween(begin: 150.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    topAnim = Tween(begin: -150.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    logoAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.9, curve: Curves.easeOutBack),
      ),
    );

    executeNavigation();

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transform.translate(
                offset: Offset(0, topAnim.value),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SvgPicture.asset(Assets.imagesSplashTopPlant),
                ),
              ),

              Transform.scale(
                scale: logoAnim.value,
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.23,
                  child: Image.asset(Assets.imagesFruitifyLogo),
                ),
              ),

              Transform.translate(
                offset: Offset(0, bottomAnim.value),
                child: SvgPicture.asset(
                  Assets.imagesSplashBottomCircles,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void executeNavigation() {
    Future.delayed(const Duration(milliseconds: 2300), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
