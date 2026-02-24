import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:fruitify/features/home/presentation/views/widgets/featured_item_button.dart';
import '../../../../../generated/assets.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return AspectRatio(
      aspectRatio: 342 / 158,
      child: Stack(
        children: [
          Image.asset(Assets.imagesFruits, fit: BoxFit.fitWidth),
          Container(
            padding: EdgeInsets.only(top: 25, bottom: 29, right: 25),
            width: width * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: svg.Svg(Assets.imagesGreenElipse),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'عروض العيد',
                  style: AppTextStyles.regular13.copyWith(color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  'خصم 25%',
                  style: AppTextStyles.bold19.copyWith(color: Colors.white),
                ),
                const Spacer(),
                SizedBox(child: FeaturedItemButton(onPressed: () {})),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
