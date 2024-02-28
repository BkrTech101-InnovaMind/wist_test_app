import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wist_test_task/cors/services/state_prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), () async {
      StatePrefs firstUsePrefs = StatePrefs("FIRST_USE");
      bool isFirstUse = await firstUsePrefs.getTheState();
      if (!isFirstUse) {
        _navigateToHome();
      } else {
        _navigateToBoarding();
      }
    });
  }

  void _navigateToHome() {
    Navigator.pushReplacementNamed(context, "home");
  }

  void _navigateToBoarding() {
    Navigator.pushReplacementNamed(context, "boarding");
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            const SizedBox(height: 20),
            const Text(
              "BankPick",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
