import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:fruitify/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruitify/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruitify/generated/assets.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.cartItem});
  final CartItemEntity cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 73,
          height: 92,
          child: Image.network(cartItem.product.imageUrl!, fit: BoxFit.cover),
        ),
        const SizedBox(width: 17),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cartItem.product.productName,
                    style: AppTextStyles.bold13.copyWith(
                      color: const Color(0xFF06161C),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    icon: SvgPicture.asset(
                      Assets.imagesTrash,
                      height: 20,
                      width: 20,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF979899),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                '${cartItem.quantity} كجم',
                style: AppTextStyles.regular13.copyWith(
                  color: const Color(0xFFF4A91F),
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _buildQuantityButton(
                        Icons.remove,
                        const Color(0xFFF3F5F7),
                        const Color(0xFF979899),
                        onPressed: () => context
                            .read<CartCubit>()
                            .decreaseCartItemCount(cartItem),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '${cartItem.count}',
                        style: AppTextStyles.bold16.copyWith(
                          color: const Color(0xFF06140C),
                        ),
                      ),
                      const SizedBox(width: 16),
                      _buildQuantityButton(
                        Icons.add,
                        const Color(0xFF1B5E37),
                        Colors.white,
                        onPressed: () => context
                            .read<CartCubit>()
                            .increaseCartItemCount(cartItem),
                      ),
                    ],
                  ),
                  Text(
                    '${cartItem.subTotal} جنيه',
                    style: AppTextStyles.bold16.copyWith(
                      color: const Color(0xFFF4A91F),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityButton(
    IconData icon,
    Color bgColor,
    Color iconColor, {
    required Function() onPressed,
  }) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          icon: Icon(icon, color: iconColor, size: 16),
          highlightColor: Colors.black12,
        ),
      ),
    );
  }
}
