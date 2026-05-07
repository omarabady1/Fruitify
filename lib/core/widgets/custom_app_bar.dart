import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String title,
  bool showLeading = true,
  VoidCallback? onLeadingPressed,
  List<Widget>? actions,
}) {
  return AppBar(
    scrolledUnderElevation: 0,
    actions: actions,
    title: Text(title, style: AppTextStyles.bold19),
    centerTitle: true,
    leading: showLeading
        ? IconButton(
            onPressed: onLeadingPressed ??
                () {
                  Navigator.maybePop(context);
                },
            icon: const Icon(Icons.arrow_back_ios),
          )
        : null,
  );
}
