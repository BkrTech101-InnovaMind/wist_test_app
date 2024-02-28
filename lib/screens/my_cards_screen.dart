import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wist_test_task/components/creadit_card.dart';
import 'package:wist_test_task/components/custom_back_button.dart';
import 'package:wist_test_task/components/custom_text.dart';
import 'package:wist_test_task/components/spending_card.dart';
import 'package:wist_test_task/cors/global/app_colors/app_color_dark.dart';
import 'package:wist_test_task/cors/provider/theme_provider.dart';

class MyCardsScreen extends StatelessWidget {
  final VoidCallback onBackButtonPressed;
  const MyCardsScreen({super.key, required this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                _headSection(context),
                const CreaditCard(),
                _transactionSection(),
              ],
            ),
          ),
          const Spendingcard()
        ],
      )),
    );
  }

  Widget _headSection(context) {
    final themeState = Provider.of<ThemeProvider>(context);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomBackButton(onPressed: onBackButtonPressed),
          const CustomText(
            text: "My Card",
            fontWeight: FontWeight.bold,
            fontSize: 3,
          ),
          IconButton(
            onPressed: () => themeState.setDarkTheme = !themeState.getTheme,
            icon:
                Icon(themeState.getTheme ? Icons.dark_mode : Icons.light_mode),
          ),
        ],
      ),
    );
  }

  Widget _transactionSection() {
    List transactionsDetails = [
      {
        "title": "AppleStore",
        "subtitle": "Entertainment",
        "leading": Icons.apple,
        "trailing": "- \$5,99"
      },
      {
        "title": "AppleStore",
        "subtitle": "Entertainment",
        "leading": Icons.apple,
        "trailing": "- \$5,99"
      },
      {
        "title": "AppleStore",
        "subtitle": "Entertainment",
        "leading": Icons.apple,
        "trailing": "- \$5,99"
      },
      {
        "title": "AppleStore",
        "subtitle": "Entertainment",
        "leading": Icons.apple,
        "trailing": "- \$5,99"
      },
      {
        "title": "AppleStore",
        "subtitle": "Entertainment",
        "leading": Icons.apple,
        "trailing": "- \$5,99"
      },
      {
        "title": "AppleStore",
        "subtitle": "Entertainment",
        "leading": Icons.apple,
        "trailing": "- \$5,99"
      },
      {
        "title": "AppleStore",
        "subtitle": "Entertainment",
        "icon": Icons.apple,
        "trailing": "- \$5,99"
      },
      {
        "title": "AppleStore",
        "subtitle": "Entertainment",
        "leading": Icons.apple,
        "trailing": "- \$5,99"
      },
    ];
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: transactionsDetails.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      transactionsDetails[index]["leading"],
                    ),
                  ),
                  title: CustomText(
                    text: transactionsDetails[index]["title"],
                    fontWeight: FontWeight.bold,
                    fontSize: 2.2,
                  ),
                  subtitle: CustomText(
                    text: transactionsDetails[index]["subtitle"],
                    color: AppColorsDark.secondaryColor,
                    fontSize: 1.7,
                  ),
                  trailing: CustomText(
                    text: transactionsDetails[index]["trailing"],
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
