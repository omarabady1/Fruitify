import 'package:flutter/material.dart';
import 'package:fruitify/features/home/presentation/views/widgets/custom_search_text_field.dart';

import 'custom_home_app_bar.dart';

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
        ],
      ),
    );
  }
}
