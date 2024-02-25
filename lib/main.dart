import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wist_test_task/cors/global/theme/theme_data.dart';
import 'package:wist_test_task/cors/provider/theme_provider.dart';
import 'package:wist_test_task/screens/home_screen.dart';
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
        await themeChangeProvider.themePrefs.getTheme();
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
          "home": (context) => const HomeScreen(),
        },
      );
    });
  }
}
