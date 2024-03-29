// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wist_test_task/cors/global/app_colors/app_color_dark.dart';
import 'package:wist_test_task/layout/_responsive_layout.dart';

class PageIndecator extends StatelessWidget {
  int currentValue = 0;
  PageIndecator({super.key, required this.currentValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: AnimatedContainer(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 400),
            width: index == currentValue
                ? ResponsiveLayout.widthMultiplier(context, 10)
                : ResponsiveLayout.widthMultiplier(context, 3),
            height: ResponsiveLayout.heightMultiplier(context, 1.5),
            decoration: BoxDecoration(
              color: index == currentValue
                  ? AppColorsDark.buttonsColor
                  : AppColorsDark.secondaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
