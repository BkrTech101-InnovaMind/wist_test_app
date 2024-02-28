import 'package:flutter/material.dart';
import 'package:wist_test_task/components/custom_back_button.dart';
import 'package:wist_test_task/components/custom_button.dart';
import 'package:wist_test_task/components/custom_text.dart';
import 'package:wist_test_task/components/custom_text_field.dart';
import 'package:wist_test_task/cors/global/app_colors/app_color_light.dart';
import 'package:wist_test_task/layout/_responsive_layout.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            top: ResponsiveLayout.heightMultiplier(context, 2),
            left: 10,
            right: 10,
          ),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child:
                      CustomBackButton(onPressed: () => Navigator.pop(context)),
                ),
                const Spacer(),
                const CustomText(
                  text: "Sign Up",
                  fontSize: 6,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                CustomTextField(
                  controller: name,
                  labelText: "Full Name",
                  validator: (p0) =>
                      p0 == null || p0.isEmpty ? "Enter Valid name" : null,
                  isPassword: false,
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: ResponsiveLayout.heightMultiplier(context, 2)),
                CustomTextField(
                  controller: phoneNumber,
                  labelText: "Phone Number",
                  validator: (p0) => p0 == null || p0.isEmpty
                      ? "Enter Valid Phone Number"
                      : null,
                  isPassword: false,
                  prefixIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: ResponsiveLayout.heightMultiplier(context, 2)),
                CustomTextField(
                  controller: email,
                  labelText: "Email Address",
                  validator: (p0) =>
                      p0 == null || p0.isEmpty ? "Enter Valid email" : null,
                  isPassword: false,
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: ResponsiveLayout.heightMultiplier(context, 2)),
                CustomTextField(
                  controller: password,
                  labelText: "Password",
                  validator: (p0) =>
                      p0 == null || p0.isEmpty ? "Enter Valid password" : null,
                  isPassword: true,
                  prefixIcon: Icons.lock_outline,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: ResponsiveLayout.heightMultiplier(context, 2)),
                const Spacer(),
                CustomButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, "home");
                    }
                  },
                  text: "Sign Up",
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(text: "Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "sign_in");
                      },
                      child: const CustomText(
                        text: "Sign In",
                        color: AppColorsLight.buttonsColor,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
