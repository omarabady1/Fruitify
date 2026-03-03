import 'package:flutter/material.dart';
import '../../../../../core/widgets/notification_widget.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/assets.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(Assets.imagesAvatar1),
      title: Text(
        'صباح الخير',
        style: AppTextStyles.regular16.copyWith(color: Colors.grey),
      ),
      subtitle: Text('مايك إيرمنتراوت', style: AppTextStyles.bold16),
      trailing: NotificationWidget(),
    );
  }
}
