import 'package:flutter/material.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/custom_buttom_nav_bar.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String routeName = 'main_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomeView()),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
