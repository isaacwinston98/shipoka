import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class PersonalProfileTwo extends StatefulWidget {
  const PersonalProfileTwo({super.key});

  @override
  State<PersonalProfileTwo> createState() => _PersonalProfileTwoState();
}

class _PersonalProfileTwoState extends State<PersonalProfileTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: AppBackButton(),
                      ),
                    ),
                    const SizedBox(width: 20.0,),
                    //Text at the center Top
                    TextSemiBold(
                      "Fill Your Profile",
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 80.0),
                      child: Stack(
                        children: [
                          Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lightBackground,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: SvgPicture.asset(AppAssets.user),
                            ),
                          ),
                          Positioned(
                            bottom:386,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                // Handle icon click
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: SvgPicture.asset(AppAssets.edit),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                ),
                const Gap(10),

              ],
            ),
          )
      ),
    );
  }
}
