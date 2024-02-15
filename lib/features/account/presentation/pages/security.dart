import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    const AppBackButton(),
                    const Gap(70),
                    TextSemiBold(
                      'Security',
                      fontSize: 20,
                    ),
                  ],
                ),
                const Gap(40),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextSemiBold(
                        "Enable Face ID",
                        fontSize: 15,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0), // Adjust padding as needed
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle, // Change shape to rectangle
                          borderRadius: BorderRadius.circular(20.0), // Add border radius
                          color: AppColors.primaryColor,
                        ),
                        child: SvgPicture.asset(
                          AppAssets.whiteCircle,
                          width: 20, // Adjust width of icon as needed
                          height: 20, // Adjust height of icon as needed
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextSemiBold(
                        "Change Pin",
                        fontSize: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to another screen
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NextScreen()),
                          );*/
                        },
                        child: SvgPicture.asset(
                          AppAssets.forwardRight,
                          width: 20, // Adjust width of icon as needed
                          height: 20, // Adjust height of icon as needed
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextSemiBold(
                        "Change Pin",
                        fontSize: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to another screen
                         /* Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NextScreen()),
                          );*/
                        },
                        child: SvgPicture.asset(
                          AppAssets.forwardRight,
                          width: 20, // Adjust width of icon as needed
                          height: 20, // Adjust height of icon as needed
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      )
    );
  }
}
