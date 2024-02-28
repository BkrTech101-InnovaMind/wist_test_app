import 'package:flutter/material.dart';
import 'package:wist_test_task/components/custom_back_button.dart';
import 'package:wist_test_task/components/custom_button.dart';
import 'package:wist_test_task/components/custom_text.dart';
import 'package:wist_test_task/components/custom_text_field.dart';
import 'package:wist_test_task/cors/global/app_colors/app_color_light.dart';
import 'package:wist_test_task/layout/_responsive_layout.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child:
                      CustomBackButton(onPressed: () => Navigator.pop(context)),
                ),
                const Spacer(),
                const Align(
                  child: CustomText(
                    text: "Sign In",
                    fontSize: 6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                CustomTextField(
                  controller: _emailController,
                  labelText: "Email",
                  isPassword: false,
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (p0) =>
                      p0 == null || p0.isEmpty ? "Enter Valid email" : null,
                ),
                SizedBox(
                  height: ResponsiveLayout.heightMultiplier(context, 2),
                ),
                CustomTextField(
                  controller: _passController,
                  labelText: "Password",
                  validator: (value) => value == null || value.isEmpty
                      ? "Enter Valid password"
                      : null,
                  isPassword: true,
                  prefixIcon: Icons.lock,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const Spacer(),
                CustomButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, "home");
                    }
                  },
                  text: "Sign In",
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(text: "Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "sign_up");
                      },
                      child: const CustomText(
                        text: "Sign Up",
                        color: AppColorsLight.buttonsColor,
                      ),
                    ),
                  ],
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
