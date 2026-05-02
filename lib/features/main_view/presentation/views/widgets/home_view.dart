import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/cubits/cubit/products%20cubit/products_cubit.dart';
import 'package:fruitify/core/functions/setup_service_locator.dart';
import 'package:fruitify/core/repos/product_repo/product_repo.dart';
import 'package:fruitify/features/main_view/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(locator<ProductRepo>()),
      child: const HomeViewBody(),
    );
  }
}
