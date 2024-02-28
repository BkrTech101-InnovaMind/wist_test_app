import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wist_test_task/components/custom_button.dart';
import 'package:wist_test_task/components/on_boarding.dart';
import 'package:wist_test_task/components/page_indecator.dart';
import 'package:wist_test_task/cors/provider/theme_provider.dart';
import 'package:wist_test_task/cors/services/state_prefs.dart';
import 'package:wist_test_task/layout/_responsive_layout.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  int _currentPage = 0;
  final screens = [
    const OnBoarding(
      title: "Fastest Payment in the world",
      subTitle:
          "Integrate multiple payment methoods to help you up the process quickly",
      image: "1",
    ),
    const OnBoarding(
      title: "The most Secoure Platfrom for Customer",
      subTitle:
          "Built-in Fingerprint, face recognition and more, keeping you completely safe",
      image: "2",
    ),
    const OnBoarding(
      title: "Paying for Everything is Easy and Convenient",
      subTitle:
          "Built-in Fingerprint, face recognition and more, keeping you completely safe",
      image: "3",
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  StatePrefs firstUsePrefs = StatePrefs("FIRST_USE");

  void signIn() async {
    bool isFirstUse = await firstUsePrefs.getTheState();
    if (isFirstUse) {
      await firstUsePrefs.setTheState(false);
      _navigate();
    } else {}
    _navigate();
  }

  void _navigate() {
    Navigator.pushNamed(context, "sign_in");
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ResponsiveLayout.widthMultiplier(context, 4),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              PageView(
                controller: _pageController,
                onPageChanged: (value) => setState(() => _currentPage = value),
                children: screens,
              ),
              Positioned(
                child: Center(child: PageIndecator(currentValue: _currentPage)),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: ResponsiveLayout.heightMultiplier(context, 3),
                  ),
                  child: CustomButton(
                    text: _currentPage == screens.length - 1
                        ? "Get Started"
                        : "Next",
                    onPressed: () => _currentPage == screens.length - 1
                        ? signIn()
                        : nextPage(),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  onPressed: () =>
                      themeState.setDarkTheme = !themeState.getTheme,
                  icon: Icon(
                      themeState.getTheme ? Icons.dark_mode : Icons.light_mode),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
