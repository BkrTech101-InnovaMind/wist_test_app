import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wist_test_task/components/custom_text.dart';
import 'package:wist_test_task/cors/global/app_colors/app_color_dark.dart';
import 'package:wist_test_task/layout/_responsive_layout.dart';

class CreaditCard extends StatelessWidget {
  const CreaditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColorsDark.cardBackgroundColor,
      child: Container(
        padding:
            EdgeInsets.all(ResponsiveLayout.heightMultiplier(context, 1.5)),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/map_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/icons/sim_card.svg"),
                SvgPicture.asset("assets/icons/unicon.svg"),
              ],
            ),
            const Center(
              child: CustomText(
                text: "4562   1122   4595   7852",
                fontSize: 3.6,
                color: AppColorsDark.primaryColor,
              ),
            ),
            SizedBox(height: ResponsiveLayout.heightMultiplier(context, 2)),
            const CustomText(
              text: "AR Jonson",
              color: AppColorsDark.primaryColor,
            ),
            Row(
              children: [
                const Expanded(
                  child: Row(children: [
                    Expanded(
                      child: ListTile(
                        tileColor: Colors.transparent,
                        contentPadding: EdgeInsets.zero,
                        title: CustomText(
                          text: "Expiry Date",
                          color: AppColorsDark.secondaryColor,
                        ),
                        subtitle: CustomText(
                          text: "12/2024",
                          color: AppColorsDark.primaryColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        tileColor: Colors.transparent,
                        title: CustomText(
                          text: "CVV",
                          color: AppColorsDark.secondaryColor,
                        ),
                        subtitle: CustomText(
                          text: "6986",
                          color: AppColorsDark.primaryColor,
                        ),
                      ),
                    ),
                  ]),
                ),
                SvgPicture.asset("assets/images/master_logo.svg"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
