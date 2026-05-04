import 'package:flutter/material.dart';
import 'package:fruitify/core/helper_functions/get_dummy_product.dart';
import '../../../../home/presentation/views/widgets/fruit_item.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: CustomScrollView(
        slivers: [
          SliverGrid.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 163 / 214,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return FruitItem(productEntity: getDummyProduct());
            },
          ),
        ],
      ),
    );
  }
}
