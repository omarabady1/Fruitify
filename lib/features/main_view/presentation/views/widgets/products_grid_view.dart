import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:fruitify/core/cubits/cubit/products%20cubit/products_cubit.dart';
import 'package:fruitify/core/helper_functions/get_dummy_product.dart';
import 'package:fruitify/core/widgets/custom_error_widget.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/fruit_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return _buildGrid(products: state.products);
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: state.error),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: _buildGrid(products: getDummyProducts()),
          );
        }
      },
    );
  }

  SliverGrid _buildGrid({required List products}) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 163 / 214,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return FruitItem(productEntity: products[index]);
      },
    );
  }
}
