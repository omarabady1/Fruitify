import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/assets.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(Assets.imagesAvatar1),
            title: Text(
              'صباح الخير',
              style: AppTextStyles.regular16.copyWith(color: Colors.grey),
            ),
            subtitle: Text('مايك إيرمنتراوت', style: AppTextStyles.bold16),
            trailing: Container(
              padding: EdgeInsets.zero,
              decoration: ShapeDecoration(
                color: const Color(0xFFEEF8ED) /* green-50 */,
                shape: OvalBorder(),
              ),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.imagesNotifications),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
