import 'package:flutter/material.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/custom_buttom_nav_bar.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/home_view.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/products_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = 'main_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentViewIndex,
          children: const [
            HomeView(),
            ProductsView(),
            Center(child: Text('Cart View')),
            Center(child: Text('Profile View')),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentViewIndex,
        onTabChanged: (index) {
          setState(() {
            currentViewIndex = index;
          });
        },
      ),
    );
  }
}
