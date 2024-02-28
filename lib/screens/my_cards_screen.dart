import 'package:flutter/material.dart';
import 'package:wist_test_task/components/custom_text.dart';

class MyCardsScreen extends StatelessWidget {
  const MyCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(child: CustomText(text: "Card Screen"))),
    );
  }
}
