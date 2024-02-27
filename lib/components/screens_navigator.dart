import 'package:flutter/material.dart';
import 'package:wist_test_task/components/icon_bottom_bar.dart';
import 'package:wist_test_task/layout/_responsive_layout.dart';
import 'package:wist_test_task/screens/home_screen.dart';

class ScreensNavigator extends StatefulWidget {
  const ScreensNavigator({super.key});

  @override
  State<ScreensNavigator> createState() => _ScreensNavigatorState();
}

class _ScreensNavigatorState extends State<ScreensNavigator> {
  int _selectedIndex = 0;
  final screens = [
    const HomeScreen(text: "1"),
    const HomeScreen(text: "2"),
    const HomeScreen(text: "3"),
    const HomeScreen(text: "4"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: screens[_selectedIndex]),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: ResponsiveLayout.heightMultiplier(context, 10),
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconBottomBar(
              text: "Home",
              icon: "home",
              selected: _selectedIndex == 0,
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            IconBottomBar(
              text: "My Cards",
              icon: "card",
              selected: _selectedIndex == 1,
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            IconBottomBar(
              text: "Statistics",
              icon: "statistics",
              selected: _selectedIndex == 2,
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
            IconBottomBar(
              text: "settings",
              icon: "settings",
              selected: _selectedIndex == 3,
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
