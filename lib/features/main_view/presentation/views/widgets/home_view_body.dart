import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/cubits/cubit/products%20cubit/products_cubit.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/best_selling_header.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/custom_search_text_field.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/featured_item_page_view.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/products_grid_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }
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
          const ProductsGridView(),
        ],
      ),
    );
  }
}
