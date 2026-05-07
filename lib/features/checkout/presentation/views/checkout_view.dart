import 'package:flutter/material.dart';
import 'package:fruitify/core/widgets/custom_app_bar.dart';
import 'package:fruitify/features/checkout/presentation/views/widgets/checkout_view_body.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});
  static const String routeName = 'checkout_view';

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      final newIndex = _pageController.page?.round() ?? 0;
      if (newIndex != _currentIndex) {
        setState(() {
          _currentIndex = newIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  String _getTitle() {
    switch (_currentIndex) {
      case 0:
        return 'الشحن';
      case 1:
        return 'العنوان';
      case 2:
        return 'الدفع';
      case 3:
        return 'المراجعة';
      default:
        return 'الشحن';
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _currentIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        if (_currentIndex > 0) {
          _pageController.animateToPage(
            _currentIndex - 1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: _getTitle(),
          showLeading: true,
          onLeadingPressed: () {
            if (_currentIndex > 0) {
              _pageController.animateToPage(
                _currentIndex - 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              Navigator.maybePop(context);
            }
          },
        ),
        body: CheckoutViewBody(
          pageController: _pageController,
        ),
      ),
    );
  }
}
