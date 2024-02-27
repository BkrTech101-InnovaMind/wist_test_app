import 'package:flutter/material.dart';
import 'package:wist_test_task/components/custom_text.dart';
import 'package:wist_test_task/layout/_responsive_layout.dart';

class CustomButton extends StatefulWidget {
  // final VoidCallback onPressed;
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveLayout.widthMultiplier(context, double.infinity),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            fixedSize: Size(
              double.infinity,
              ResponsiveLayout.heightMultiplier(context, 6),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveLayout.widthMultiplier(context, 15),
              vertical: 0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        child: CustomText(
          text: "text",
          fontWeight: FontWeight.bold,
          fontSize: 4,
        ),
      ),
    );
  }
}
