import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruitify/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:fruitify/generated/assets.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView(this.pageController,{super.key});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible: true,
          image: Assets.imagesFruitBasket1,
          backgroundImage: Assets.imagesPageViewItem1BackgroundImage,
          title: SvgPicture.asset(Assets.imagesPageViewItem1Title),
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
        ),
        PageViewItem(
          isVisible: false,
          image: Assets.imagesPineapple,
          backgroundImage: Assets.imagesPageViewItem2BackgroundImage,
          title: SvgPicture.asset(Assets.imagesPageViewItem2Title),
          subtitle:
            'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية.'
        ),
      ],
    );
  }
}
