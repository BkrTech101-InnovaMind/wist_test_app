import 'package:flutter/material.dart';
import 'package:wist_test_task/layout/_responsive_layout.dart';

class CustomBackButton extends StatefulWidget {
  final VoidCallback onPressed;
  const CustomBackButton({super.key, required this.onPressed});

  @override
  State<CustomBackButton> createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onPressed,
      icon: const Icon(Icons.arrow_back_ios_new),
      iconSize: ResponsiveLayout.widthMultiplier(context, 6),
      padding: EdgeInsets.all(
        ResponsiveLayout.widthMultiplier(context, 3),
      ),
    );
  }
}
