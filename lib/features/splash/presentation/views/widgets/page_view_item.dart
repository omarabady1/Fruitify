import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.subtitle,
  });
  final String image, backgroundImage;
  final Widget title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Stack(
            alignment: AlignmentGeometry.bottomCenter,
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              SvgPicture.asset(image),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(top: 20, right: 10),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'تخطٍ',
                      style: GoogleFonts.cairo(
                        color: const Color(0xFF949D9E),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        height: 1.70,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 64),
        title,
        SizedBox(height: 24),
        SizedBox(
          width: 301,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.cairo(
              color: const Color(0xFF4E5556),
              fontSize: 13,
              fontWeight: FontWeight.w600,
              height: 1.70,
            ),
          ),
        ),
      ],
    );
  }
}
