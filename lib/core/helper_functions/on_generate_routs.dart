import 'package:flutter/material.dart';
import 'package:fruitify/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruitify/features/splash/presentation/views/splash_view.dart';

import '../../features/authentication/presentation/views/sign_in_view.dart';
import '../../features/authentication/presentation/views/sign_up_view.dart';
import '../../features/main_view/presentation/views/main_view.dart';
import '../../features/best_selling/presentation/views/best_selling_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());
    default:
      return MaterialPageRoute(builder: (context) => Container());
  }
}
