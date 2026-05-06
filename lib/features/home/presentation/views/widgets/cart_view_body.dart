import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/widgets/custom_app_bar.dart';
import 'package:fruitify/core/widgets/custom_button.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:fruitify/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruitify/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruitify/features/home/presentation/views/widgets/cart_item_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<CartItemEntity> cartItems = context.watch<CartCubit>().cartEntity.cartItems;
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  buildAppBar(
                    context,
                    title: 'السلة',
                    showLeading: true,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    color: const Color(0xFFEBF9F1),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        'لديك ${cartItems.length} منتجات في سله التسوق',
                        style: AppTextStyles.regular13.copyWith(
                          color: const Color(0xFF1B5E37),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            cartItems.isEmpty
                ? const SliverToBoxAdapter(
                    child: Center(
                      child: Text('سلة التسوق فارغة'),
                    ),
                  )
                : CartItemList(cartItems: cartItems),
            const SliverToBoxAdapter(
              child: SizedBox(height: 100), // Space for bottom button
            ),
          ],
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: CustomButton(
            label: 'الدفع ${context.read<CartCubit>().cartEntity.totalPrice} جنيه',
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
