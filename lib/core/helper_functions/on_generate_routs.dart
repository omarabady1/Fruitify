import 'package:flutter/material.dart';
import 'package:fruitify/features/on_boarding/presentaion/views/on_boarding_view.dart';
import 'package:fruitify/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    default:
      return MaterialPageRoute(builder: (context) => Container());
  }
}
