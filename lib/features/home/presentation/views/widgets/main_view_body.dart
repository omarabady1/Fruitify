import 'package:flutter/material.dart';
import 'package:fruitify/features/home/presentation/views/cart_view.dart';
import 'package:fruitify/features/home/presentation/views/home_view.dart';
import 'package:fruitify/features/home/presentation/views/products_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IndexedStack(
        index: currentViewIndex,
        children: const [
          HomeView(),
          ProductsView(),
          CartView(),
          Center(child: Text('Profile View')),
        ],
      ),
    );
  }
}
