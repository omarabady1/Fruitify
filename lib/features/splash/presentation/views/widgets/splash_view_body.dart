import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../generated/assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(Assets.imagesSplashTopPlant),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.23,
            child: Image.asset(Assets.imagesFruitifyLogo),
          ),
          SvgPicture.asset(Assets.imagesSplashBottomCircles, fit: BoxFit.fill),
        ],
      ),
    );
  }
}
