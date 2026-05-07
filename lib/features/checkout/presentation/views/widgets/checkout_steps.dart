import 'package:flutter/material.dart';
import 'package:fruitify/features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    const steps = ['الشحن', 'العنوان', 'الدفع'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        steps.length,
        (index) => StepItem(
          text: steps[index],
          index: index + 1,
          isActive: currentStep >= index + 1,
        ),
      ),
    );
  }
}
