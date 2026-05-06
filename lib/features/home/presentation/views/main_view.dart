import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruitify/features/home/presentation/views/widgets/custom_buttom_nav_bar.dart';
import 'package:fruitify/features/home/presentation/views/widgets/main_view_body_bloc_consumer.dart';

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
    return PopScope(
      canPop: currentViewIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          if (currentViewIndex != 0) {
            setState(() {
              currentViewIndex = 0;
            });
          }
        }
      },
      child: BlocProvider(
        create: (context) => CartCubit(),
        child: Scaffold(
          body: MainViewBodyBlocConsumer(currentViewIndex: currentViewIndex),
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: currentViewIndex,
            onTabChanged: (index) {
              setState(() {
                currentViewIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
