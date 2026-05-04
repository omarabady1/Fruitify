import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:fruitify/generated/assets.dart';

class CategoryModel {
  final String title;
  final String image;

  const CategoryModel({required this.title, required this.image});
}

class ProductsCategories extends StatelessWidget {
  const ProductsCategories({super.key});

  static const List<CategoryModel> categories = [
    CategoryModel(title: 'أناناس', image: Assets.imagesPineapple),
    CategoryModel(title: 'بطيخ', image: Assets.imagesWatermelon),
    CategoryModel(title: 'موز', image: Assets.imagesFruits),
    CategoryModel(title: 'فراولة', image: Assets.imagesStrawberry),
    CategoryModel(title: 'افوكادو', image: Assets.imagesFruits),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return Column(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: const Color(0xFFF3F5F7),
                child: categories[index].image.endsWith('.svg')
                    ? SvgPicture.asset(categories[index].image, width: 40, height: 40)
                    : Image.asset(categories[index].image, width: 40, height: 40),
              ),
              const SizedBox(height: 8),
              Text(
                categories[index].title,
                style: AppTextStyles.semiBold13,
              ),
            ],
          );
        },
      ),
    );
  }
}
