import 'package:flutter/material.dart';
import 'package:fruitify/core/widgets/custom_button.dart';
import 'package:fruitify/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruitify/features/checkout/presentation/views/widgets/shipping_section.dart';

import 'package:fruitify/features/checkout/presentation/views/widgets/address_section.dart';
import 'package:fruitify/features/checkout/presentation/views/widgets/payment_section.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      final newIndex = widget.pageController.page?.toInt() ?? 0;
      if (newIndex != _currentIndex) {
        setState(() {
          _currentIndex = newIndex;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CheckoutSteps(currentStep: _currentIndex + 1),
          const SizedBox(height: 32),
          Expanded(
            child: PageView(
              controller: widget.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ShippingSection(),
                AddressSection(),
                PaymentSection(),
              ],
            ),
          ),
          CustomButton(
            label: _currentIndex == 2 ? 'تأكيد الطلب' : 'التالي',
            onPressed: () {
              if (_currentIndex < 2) {
                widget.pageController.animateToPage(
                  _currentIndex + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
