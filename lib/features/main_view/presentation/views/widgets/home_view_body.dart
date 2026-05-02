import 'package:flutter/material.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/best_selling_header.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/custom_search_text_field.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/featured_item_page_view.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/fruit_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
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
          SliverToBoxAdapter(child: FeaturedItemPageView()),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(child: BestSellingHeader()),
          SliverToBoxAdapter(child: SizedBox(height: 8)),
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
