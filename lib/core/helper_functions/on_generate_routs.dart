import 'package:flutter/material.dart';
import 'package:fruitify/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruitify/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruitify/features/splash/presentation/views/splash_view.dart';

import '../../features/authentication/presentation/views/sign_in_view.dart';
import '../../features/authentication/presentation/views/sign_up_view.dart';
import '../../features/home/presentation/views/main_view.dart';
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
    case CheckoutView.routeName:
      return MaterialPageRoute(builder: (context) => const CheckoutView());
    default:
      return MaterialPageRoute(builder: (context) => Container());
  }
}
