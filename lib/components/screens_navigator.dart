import 'package:flutter/material.dart';
import 'package:wist_test_task/components/icon_bottom_bar.dart';
import 'package:wist_test_task/layout/_responsive_layout.dart';
import 'package:wist_test_task/screens/home_screen.dart';
import 'package:wist_test_task/screens/my_cards_screen.dart';
import 'package:wist_test_task/screens/settings_screen.dart';
import 'package:wist_test_task/screens/statistics_screen.dart';

class ScreensNavigator extends StatefulWidget {
  const ScreensNavigator({super.key});

  @override
  State<ScreensNavigator> createState() => _ScreensNavigatorState();
}

class _ScreensNavigatorState extends State<ScreensNavigator> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final List<Widget> screens = [];

  navigateBack() {
    _pageController.animateToPage(
      _selectedIndex - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void initState() {
    super.initState();
    screens.addAll({
      const HomeScreen(),
      MyCardsScreen(onBackButtonPressed: navigateBack),
      const StatisticsScreen(),
      SettingsScreen(
        onBackButtonPressed: navigateBack,
      ),
    });
  }

  void iconPressed(int index) {
    _pageController.animateToPage(
      _selectedIndex = index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            top: ResponsiveLayout.heightMultiplier(context, 2),
            left: ResponsiveLayout.widthMultiplier(context, 2),
            right: ResponsiveLayout.widthMultiplier(context, 2),
          ),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (value) => setState(() => _selectedIndex = value),
            // physics: const NeverScrollableScrollPhysics(),
            children: screens,
          ),
        ),
      ),
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
              onPressed: () => setState(() => iconPressed(0)),
            ),
            IconBottomBar(
              text: "My Cards",
              icon: "card",
              selected: _selectedIndex == 1,
              onPressed: () => setState(() => iconPressed(1)),
            ),
            IconBottomBar(
              text: "Statistics",
              icon: "statistics",
              selected: _selectedIndex == 2,
              onPressed: () => setState(() => iconPressed(2)),
            ),
            IconBottomBar(
              text: "settings",
              icon: "settings",
              selected: _selectedIndex == 3,
              onPressed: () => setState(() => iconPressed(3)),
            ),
          ],
        ),
      ),
    );
  }
}
