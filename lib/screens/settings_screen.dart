import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wist_test_task/components/custom_back_button.dart';
import 'package:wist_test_task/components/custom_text.dart';
import 'package:wist_test_task/cors/global/app_colors/app_color_dark.dart';
import 'package:wist_test_task/cors/provider/theme_provider.dart';
import 'package:wist_test_task/layout/_responsive_layout.dart';

class SettingsScreen extends StatelessWidget {
  final VoidCallback onBackButtonPressed;
  const SettingsScreen({super.key, required this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headSection(context),
            SizedBox(height: ResponsiveLayout.heightMultiplier(context, 5)),
            Expanded(
              child: Column(children: [
                _generalSettingsSection(context),
                _secureSettingsSection(),
                _bioSection(),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _headSection(context) {
    final themeState = Provider.of<ThemeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBackButton(onPressed: onBackButtonPressed),
        const CustomText(
          text: "Settings",
          fontWeight: FontWeight.bold,
          fontSize: 3,
        ),
        IconButton(
          onPressed: () => themeState.setDarkTheme = !themeState.getTheme,
          icon: Icon(themeState.getTheme ? Icons.dark_mode : Icons.light_mode),
        ),
      ],
    );
  }

  Widget _generalSettingsSection(context) {
    final List settingOptions = [
      {
        "title": "Language",
        "trailing": Icons.arrow_forward_ios_rounded,
        "onTap": () {},
      },
      {
        "title": "My Profile",
        "trailing": Icons.arrow_forward_ios_rounded,
        "onTap": () {
          Navigator.pushNamed(context, "profile");
        },
      },
      {
        "title": "Contact Us",
        "trailing": Icons.arrow_forward_ios_rounded,
        "onTap": () {},
      },
    ];
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "General",
            color: AppColorsDark.secondaryColor,
            fontSize: 2.5,
          ),
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: settingOptions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: CustomText(
                    text: "${settingOptions[index]["title"]}",
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: Icon(settingOptions[index]["trailing"]),
                  onTap: settingOptions[index]["onTap"],
                );
              },
              separatorBuilder: (_, index) => Divider(),
            ),
          )
        ],
      ),
    );
  }

  Widget _secureSettingsSection() {
    final List settingOptions = [
      {
        "title": "Change Password",
        "trailing": Icons.arrow_forward_ios_rounded,
        "onTap": () {},
      },
      {
        "title": "Privacy Policy",
        "trailing": Icons.arrow_forward_ios_rounded,
        "onTap": () {},
      },
    ];
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Security",
            color: AppColorsDark.secondaryColor,
            fontSize: 2.5,
          ),
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: settingOptions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: CustomText(
                    text: "${settingOptions[index]["title"]}",
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: Icon(settingOptions[index]["trailing"]),
                  onTap: settingOptions[index]["onTap"],
                );
              },
              separatorBuilder: (_, index) => Divider(),
            ),
          )
        ],
      ),
    );
  }

  Widget _bioSection() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Choose what data you share with us",
            color: AppColorsDark.secondaryColor,
            fontSize: 2,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: const CustomText(
                    text: "Biometric",
                    fontWeight: FontWeight.bold,
                    fontSize: 2,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
