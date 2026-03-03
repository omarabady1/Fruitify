import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../generated/assets.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: ShapeDecoration(
        color: const Color(0xFFEEF8ED) /* green-50 */,
        shape: OvalBorder(),
      ),
      child: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(Assets.imagesNotifications),
      ),
    );
  }
}
