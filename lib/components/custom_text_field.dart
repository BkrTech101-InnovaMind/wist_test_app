import 'package:flutter/material.dart';
import 'package:wist_test_task/cors/global/app_colors/app_color_dark.dart';
import 'package:wist_test_task/cors/global/app_colors/app_color_light.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final bool isPassword;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    required this.isPassword,
    required this.prefixIcon,
    required this.keyboardType,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _showPass = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColorsLight.secondaryColor.withOpacity(0.3),
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColorsDark.secondaryColor.withOpacity(0.3),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColorsDark.buttonsColor.withOpacity(0.6),
          ),
        ),
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: AppColorsDark.secondaryColor,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () => setState(() => _showPass = !_showPass),
                icon: Icon(
                  _showPass ? Icons.visibility_off : Icons.visibility,
                ),
                color: AppColorsDark.secondaryColor,
              )
            : null,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: AppColorsDark.secondaryColor,
        ),
      ),
      obscureText: widget.isPassword ? !_showPass : false,
      keyboardType: widget.keyboardType,
      maxLength: widget.isPassword ? 20 : null,
      validator: widget.validator,
    );
  }
}
