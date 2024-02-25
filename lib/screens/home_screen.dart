import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wist_test_task/cors/provider/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: SwitchListTile(
          title: const Text("Theme"),
          secondary:
              Icon(themeState.getTheme ? Icons.dark_mode : Icons.light_mode),
          onChanged: (bool value) {
            themeState.setDarkTheme = value;
          },
          value: themeState.getTheme,
        ),
      ),
    );
  }
}
