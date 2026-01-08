import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String title,
  bool showLeading = true,
}) {
  return AppBar(
    scrolledUnderElevation: 0,
    title: Text(title, style: AppTextStyles.bold19),
    centerTitle: true,
    leading: showLeading
        ? IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          )
        : null,
  );
}
