import 'package:flutter/material.dart';
import 'package:fruitify/generated/assets.dart';
import '../../../../../core/utils/app_text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

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
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 30),
                Flexible(child: Image.asset(Assets.imagesStrawberry,)),
                SizedBox(height: 10),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('فراولة', style: AppTextStyles.semiBold13),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: ' 30جنية ',
                          style: AppTextStyles.bold13.copyWith(
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
                      splashColor: Colors.white.withValues(alpha: 0.3), // splash color
                      highlightColor: Colors.white.withValues(alpha: 0.1),
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
