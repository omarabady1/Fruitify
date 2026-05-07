import 'package:flutter/material.dart';
import 'package:fruitify/features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          child: ShippingItem(
            title: 'الدفع عند الاستلام',
            subtext: 'التسليم من المكان',
            price: '40 جنيه',
            isActive: selectedIndex == 0,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          child: ShippingItem(
            title: 'الدفع أونلاين ',
           subtext: 'يرجي تحديد طريقه الدفع',
            price: 'مجاني',
            isActive: selectedIndex == 1,
          ),
        ),
      ],
    );
  }
}
