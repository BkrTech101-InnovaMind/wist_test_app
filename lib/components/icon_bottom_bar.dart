import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wist_test_task/components/custom_text.dart';
import 'package:wist_test_task/cors/global/app_colors/app_color_light.dart';
import 'package:wist_test_task/layout/_responsive_layout.dart';

class IconBottomBar extends StatelessWidget {
  final String text;
  final String icon;
  final bool selected;
  final VoidCallback? onPressed;
  const IconBottomBar({
    super.key,
    required this.text,
    required this.icon,
    required this.selected,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.transparent),
          ),
          onPressed: onPressed,
          icon: SvgPicture.asset(
            "assets/icons/$icon.svg",
            colorFilter: ColorFilter.mode(
              selected
                  ? AppColorsLight.buttonsColor
                  : AppColorsLight.secondaryColor,
              BlendMode.srcIn,
            ),
            height: ResponsiveLayout.heightMultiplier(context, 4),
          ),
          color: selected
              ? AppColorsLight.buttonsColor
              : AppColorsLight.secondaryColor,
        ),
        CustomText(
          text: text,
          fontSize: 1.5,
          color: selected
              ? AppColorsLight.buttonsColor
              : AppColorsLight.secondaryColor,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }
}
