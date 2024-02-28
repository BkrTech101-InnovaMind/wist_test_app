import 'package:flutter/material.dart';
import 'package:wist_test_task/components/custom_text.dart';
import 'package:wist_test_task/layout/_responsive_layout.dart';

class OnBoarding extends StatefulWidget {
  final String title;
  final String subTitle;
  final String image;
  const OnBoarding({
    super.key,
    required this.title,
    required this.image,
    required this.subTitle,
  });

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            "assets/images/on_boarding_${widget.image}.png",
            cacheWidth: ResponsiveLayout.widthMultiplier(context, 100).toInt(),
            cacheHeight: 300,
          ),
          const Spacer(),
          SizedBox(
              width: ResponsiveLayout.widthMultiplier(context, 70),
              child: Column(
                children: [
                  CustomText(
                    text: widget.title,
                    fontWeight: FontWeight.bold,
                    fontSize: 3.1,
                    alignment: TextAlign.center,
                  ),
                  CustomText(
                    text: widget.subTitle,
                    alignment: TextAlign.center,
                    fontSize: 1.8,
                  ),
                ],
              )),
          const Spacer(),
        ],
      ),
    );
  }
}
