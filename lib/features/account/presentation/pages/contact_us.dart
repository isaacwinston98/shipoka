import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  const AppBackButton(),
                  const Gap(50),
                  TextSemiBold(
                    'Contact Us',
                    fontSize: 20,
                  ),
                ],
              ),
              const Gap(30),
              Row(
                children: [
                  Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextSemiBold(
                          "How can we help you?",
                      fontSize: 16, ),
                      TextSmall("We would love to hear from you"),
                    ],
                  ),
                ],
              ),
              const Gap(40),
             Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // Adjust border radius
                color: AppColors.lightGrey3, // Set background color
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(AppAssets.calender2),
                        const Gap(10),
                        TextSemiBold(
                          "Customer Service",
                          fontSize: 15,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0,top: 10.0),
                      child: Container(
                          padding: EdgeInsets.only(right: 4.0, left:4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.lightPink3,
                        ),
                        child: TextBody(
                            "Chat",
                          style: TextStyle(
                            color: AppColors.primaryColor
                          ),
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
              const Gap(20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Adjust border radius
                  color: AppColors.lightGrey3, // Set background color
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppAssets.calender2),
                          const Gap(10),
                          TextSemiBold(
                            "Email Address",
                            fontSize: 15,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0,top: 10.0),
                        child: Container(
                            padding: EdgeInsets.only(right: 4.0, left:4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lightPink3,
                            ),
                            child: TextBody(
                              "Send mail",
                              style: TextStyle(
                                  color: AppColors.primaryColor
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Adjust border radius
                  color: AppColors.lightGrey3, // Set background color
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppAssets.calender2),
                          const Gap(10),
                          TextSemiBold(
                            "Facebook",
                            fontSize: 15,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0,top: 10.0),
                        child: Container(
                            padding: EdgeInsets.only(right: 4.0, left: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lightPink3,
                            ),
                            child: TextBody(
                              "Follow Us",
                              style: TextStyle(
                                  color: AppColors.primaryColor
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Adjust border radius
                  color: AppColors.lightGrey3, // Set background color
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppAssets.calender2),
                          const Gap(10),
                          TextSemiBold(
                            "Instagram",
                            fontSize: 15,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0,top: 10.0),
                        child: Container(
                            padding: EdgeInsets.only(right: 4.0, left:4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lightPink3,
                            ),
                            child: TextBody(
                              "Follow Us",
                              style: TextStyle(
                                  color: AppColors.primaryColor
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),

          ]
          )
        )
      )
    );
  }
}


