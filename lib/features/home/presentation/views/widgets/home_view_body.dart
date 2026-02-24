import 'package:flutter/material.dart';
import 'package:fruitify/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:fruitify/features/home/presentation/views/widgets/fruit_item.dart';

import 'custom_home_app_bar.dart';
import 'featured_item_page_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 16),
                CustomHomeAppBar(),
                SizedBox(height: 16),
                CustomSearchField(),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(
            child: FeaturedItemPageView(),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverGrid.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 163 / 214,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return FruitItem();
            },
          ),
        ],
      ),
    );
  }
}
