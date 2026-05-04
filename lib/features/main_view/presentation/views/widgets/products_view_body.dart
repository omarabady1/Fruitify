import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/cubits/cubit/products%20cubit/products_cubit.dart';
import 'package:fruitify/core/widgets/custom_app_bar.dart';
import 'package:fruitify/core/widgets/notification_widget.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/best_selling_header.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/custom_search_text_field.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/products_categories.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/products_view_header.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
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
                buildAppBar(
                  context,
                  title: 'المنتجات',
                  showLeading: false,
                  actions: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: NotificationWidget(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const CustomSearchField(),
                const SizedBox(height: 12),
                const ProductsViewHeader(),
                const SizedBox(height: 16),
                const ProductsCategories(),
                const SizedBox(height: 24),
                const BestSellingHeader(),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
