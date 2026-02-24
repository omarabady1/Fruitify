import 'package:flutter/material.dart';

import 'featured_item.dart';

class FeaturedItemPageView extends StatelessWidget {
  const FeaturedItemPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 342 / 158,
      child: PageView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: FeaturedItem(),
          );
        },
      ),
    );
  }
}