import 'package:flutter/material.dart';
import 'package:fruitify/constants.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: GNav(
        tabMargin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.all(16),
        color: Colors.grey,
        tabBackgroundColor: Colors.green.shade100,
        onTabChange: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        gap: 8,
        tabs: [
          GButton(
            icon: Icons.home_outlined,
            iconActiveColor: primaryColor,
            text: 'الرئيسية',
            textStyle: AppTextStyles.semiBold11.copyWith(color: primaryColor),
          ),
          GButton(
            icon: Icons.window_outlined,
            iconActiveColor: primaryColor,
            text: 'المنتجات',
            textStyle: AppTextStyles.semiBold11.copyWith(color: primaryColor),
          ),
          GButton(
            icon: Icons.shopping_cart_outlined,
            iconActiveColor: primaryColor,
            text: 'سلة التسوق',
            textStyle: AppTextStyles.semiBold11.copyWith(color: primaryColor),
          ),
          GButton(
            icon: Icons.person_outline,
            iconActiveColor: primaryColor,
            text: 'حسابي',
            textStyle: AppTextStyles.semiBold11.copyWith(color: primaryColor),
          ),
        ],
      ),
    );
  }
}
