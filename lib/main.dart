import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wist_test_task/components/screens_navigator.dart';
import 'package:wist_test_task/cors/global/theme/theme_data.dart';
import 'package:wist_test_task/cors/provider/theme_provider.dart';
import 'package:wist_test_task/screens/on_boarding_screen.dart';
import 'package:wist_test_task/screens/profile_screen.dart';
import 'package:wist_test_task/screens/sign_in_screen.dart';
import 'package:wist_test_task/screens/sign_up_screen.dart';
import 'package:wist_test_task/screens/splash_screen.dart';

ThemeProvider themeChangeProvider = ThemeProvider();
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => themeChangeProvider,
          child: const BankPick(),
        )
      ],
      child: const BankPick(),
    ),
  );
}

class BankPick extends StatefulWidget {
  const BankPick({super.key});

  @override
  State<BankPick> createState() => _BankPickState();
}

class _BankPickState extends State<BankPick> {
  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.themePrefs.getTheState();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        theme: Styles.themeData(themeProvider.getTheme, context),
        initialRoute: "/",
        routes: {
          "/": (context) => const SplashScreen(),
          "home": (context) => const ScreensNavigator(),
          "boarding": (context) => const OnBoardingScreen(),
          "sign_in": (context) => const SignInScreen(),
          "sign_up": (context) => const SignUpScreen(),
          "profile": (context) => const ProfileScreen(),
        },
      );
    });
  }
}
