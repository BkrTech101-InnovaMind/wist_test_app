import 'package:flutter/material.dart';
import 'package:wist_test_task/components/custom_text.dart';
import 'package:wist_test_task/layout/_responsive_layout.dart';

class Spendingcard extends StatefulWidget {
  const Spendingcard({super.key});

  @override
  State<Spendingcard> createState() => _SpendingcardState();
}

class _SpendingcardState extends State<Spendingcard> {
  double sliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: ResponsiveLayout.heightMultiplier(context, 0.5),
        ),
        const CustomText(
          text: "Monthly spending limit",
          fontSize: 2,
        ),
        SizedBox(
          height: ResponsiveLayout.heightMultiplier(context, 3),
        ),
        Card(
          child: Container(
            padding:
                EdgeInsets.all(ResponsiveLayout.widthMultiplier(context, 3)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: CustomText(
                    text: "Amount: \$8,545.00",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Slider(
                  value: sliderValue,
                  max: 100,
                  divisions: 2,
                  label: sliderValue.round().toString(),
                  onChanged: (value) => setState(() => sliderValue = value),
                ),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(text: "text"),
                      CustomText(text: "text"),
                      CustomText(text: "text"),
                    ])
              ],
            ),
          ),
        ),
      ],
    );
  }
}
