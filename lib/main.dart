import 'package:flutter/material.dart';
import 'package:fruitify/core/helper_functions/on_generate_routs.dart';
import 'package:fruitify/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const Fruitify());
}

class Fruitify extends StatelessWidget {
  const Fruitify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
