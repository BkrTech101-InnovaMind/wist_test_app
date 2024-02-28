import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wist_test_task/components/creadit_card.dart';
import 'package:wist_test_task/components/custom_text.dart';
import 'package:wist_test_task/cors/global/app_colors/app_color_dark.dart';
import 'package:wist_test_task/cors/global/app_colors/app_color_light.dart';
import 'package:wist_test_task/cors/provider/theme_provider.dart';
import 'package:wist_test_task/layout/_responsive_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: ResponsiveLayout.widthMultiplier(context, 1.5)),
          child: Column(
            children: [
              Column(
                children: [
                  _headSection(),
                  CreaditCard(),
                  _navigateSection(),
                ],
              ),
              Expanded(child: _transactionSection()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headSection() {
    final themeState = Provider.of<ThemeProvider>(context);
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, "profile"),
          child: CachedNetworkImage(
            imageUrl: "https://avatars.githubusercontent.com/u/93738112?v=4",
            imageBuilder: (context, imageProvider) => CircleAvatar(
              backgroundImage: imageProvider,
              radius: ResponsiveLayout.heightMultiplier(context, 3),
            ),
            placeholder: (context, url) => const Center(
              child:
                  CircularProgressIndicator(color: AppColorsLight.primaryColor),
            ),
          ),
        ),
        const Expanded(
          child: ListTile(
            title: CustomText(
              text: "Welcome Back",
              fontSize: 1.4,
              color: AppColorsDark.secondaryColor,
            ),
            subtitle: CustomText(
              text: "Abobakr Mahdi",
              fontSize: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
          onPressed: () => themeState.setDarkTheme = !themeState.getTheme,
          icon: Icon(themeState.getTheme ? Icons.dark_mode : Icons.light_mode),
        ),
      ],
    );
  }

  Widget _navigateSection() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: ResponsiveLayout.heightMultiplier(context, 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_upward),
                iconSize: ResponsiveLayout.heightMultiplier(context, 3.5),
                padding: EdgeInsets.all(
                    ResponsiveLayout.widthMultiplier(context, 3)),
              ),
              CustomText(
                text: "Sent",
                fontSize: 2,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_downward),
                iconSize: ResponsiveLayout.heightMultiplier(context, 3.5),
                padding: EdgeInsets.all(
                    ResponsiveLayout.widthMultiplier(context, 3)),
              ),
              CustomText(
                text: "Receive",
                fontSize: 2,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.monetization_on_outlined),
                iconSize: ResponsiveLayout.heightMultiplier(context, 3.5),
                padding: EdgeInsets.all(
                    ResponsiveLayout.widthMultiplier(context, 3)),
              ),
              CustomText(
                text: "Loan",
                fontSize: 2,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.cloud_upload_outlined),
                iconSize: ResponsiveLayout.heightMultiplier(context, 3.5),
                padding: EdgeInsets.all(
                    ResponsiveLayout.widthMultiplier(context, 3)),
              ),
              CustomText(
                text: "Topup",
                fontSize: 2,
                fontWeight: FontWeight.bold,
              )
            ],
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
        "icon": Icons.apple,
      },
      {
        "title": "AppleStore",
        "subtitle": "Entertainment",
        "icon": Icons.apple,
      },
      {
        "title": "AppleStore",
        "subtitle": "Entertainment",
        "icon": Icons.apple,
      },
      {
        "title": "AppleStore",
        "subtitle": "Entertainment",
        "icon": Icons.apple,
      },
      {
        "title": "AppleStore",
        "subtitle": "Entertainment",
        "icon": Icons.apple,
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Transactions",
          fontWeight: FontWeight.bold,
          fontSize: 3,
        ),
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
                    transactionsDetails[index]["icon"],
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
              );
            },
          ),
        )
      ],
    );
  }
}
