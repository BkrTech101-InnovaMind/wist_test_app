import 'package:flutter/material.dart';
import 'package:wist_test_task/cors/global/app_colors/app_color_dark.dart';
import 'package:wist_test_task/cors/global/app_colors/app_color_light.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      fontFamily: "Poppins",
      scaffoldBackgroundColor: isDarkTheme
          ? AppColorsDark.backGroundColor
          : AppColorsLight.backGroundColor,
      primaryColor: isDarkTheme
          ? AppColorsDark.primaryColor
          : AppColorsLight.primaryColor,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: isDarkTheme
                ? AppColorsDark.secondaryColor
                : AppColorsLight.secondaryColor,
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      canvasColor: isDarkTheme
          ? AppColorsDark.backGroundColor
          : AppColorsLight.backGroundColor,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light(),
          ),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: isDarkTheme
                ? AppColorsDark.primaryColor
                : AppColorsLight.primaryColor,
          ),
      primaryTextTheme: Theme.of(context).primaryTextTheme.apply(
            bodyColor: isDarkTheme
                ? AppColorsDark.primaryColor
                : AppColorsLight.primaryColor,
          ),
      bottomAppBarTheme: Theme.of(context).bottomAppBarTheme.copyWith(
            color: isDarkTheme
                ? AppColorsDark.appBottomNavigationBar
                : AppColorsLight.appBottomNavigationBar,
          ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorsLight.buttonsColor,
          foregroundColor: AppColorsDark.primaryColor,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: isDarkTheme
              ? AppColorsDark.backButtonColor
              : AppColorsLight.appBottomNavigationBar,
          foregroundColor: isDarkTheme
              ? AppColorsLight.appBottomNavigationBar
              : AppColorsDark.appBottomNavigationBar,
        ),
      ),
      inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
            contentPadding: const EdgeInsets.all(0),
          ),
      listTileTheme: Theme.of(context).listTileTheme.copyWith(
            tileColor: isDarkTheme
                ? AppColorsDark.backGroundColor
                : AppColorsLight.backGroundColor,
            textColor: isDarkTheme
                ? AppColorsDark.primaryColor
                : AppColorsLight.primaryColor,
            iconColor: isDarkTheme
                ? AppColorsDark.primaryColor
                : AppColorsLight.primaryColor,
          ),
    );
  }
}
