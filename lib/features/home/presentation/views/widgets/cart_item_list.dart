import 'package:flutter/material.dart';
import 'package:fruitify/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruitify/features/home/presentation/views/widgets/cart_item_widget.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: cartItems.length,
      separatorBuilder: (context, index) => const Divider(
        height: 32,
        color: Color(0xFFF1F1F5),
        thickness: 1,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CartItemWidget(cartItem: cartItems[index]),
        );
      },
    );
  }
}