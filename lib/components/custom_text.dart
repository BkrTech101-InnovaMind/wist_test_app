import 'package:flutter/material.dart';
import 'package:wist_test_task/cors/global/app_colors/app_color_dark.dart';
import 'package:wist_test_task/layout/_responsive_layout.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final TextAlign? alignment;
  const CustomText({
    super.key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontSize,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: ResponsiveLayout.heightMultiplier(context, fontSize ?? 1.7),
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color,
      ),
      textAlign: alignment,
    );
  }
}
