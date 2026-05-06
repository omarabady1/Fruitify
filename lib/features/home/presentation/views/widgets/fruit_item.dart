import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import '../../../../../core/entities/product_entity.dart';
import '../../../../../core/utils/app_text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F5F7),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 30),
                Flexible(
                  child: productEntity.imageUrl != null
                      ? Image.network(productEntity.imageUrl!)
                      : const Icon(Icons.image, size: 60, color: Colors.grey),
                ),
                SizedBox(height: 10),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    productEntity.productName,
                    style: AppTextStyles.semiBold13,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: ' ${productEntity.price} جنيه ',
                          style: AppTextStyles.semiBold13.copyWith(
                            color: const Color(0xFFF4A91F),
                          ),
                        ),
                        TextSpan(
                          text: '/ الكيلو',
                          style: AppTextStyles.semiBold13.copyWith(
                            color: const Color(0xFFF4A91F),
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: Material(
                    color: const Color(0xFF1B5E37),
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      splashColor: Colors.white.withValues(
                        alpha: 0.3,
                      ),
                      highlightColor: Colors.white.withValues(alpha: 0.1),
                      onTap: () {
                        context.read<CartCubit>().addToCart(productEntity);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
          ),
        ],
      ),
    );
  }
}
