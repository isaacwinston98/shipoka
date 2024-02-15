import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class HelpCenter extends StatelessWidget {
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
                    'Help Center',
                    fontSize: 20,
                  ),
                ],
              ),
              const Gap(15),
              TextSmall(
                "Welcome to our Help Center for quick and reliable support.",
                fontSize: 16, // Adjust the font size as needed
              ),
              const Gap(40),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: AppColors.lightGrey),
                ),
                  child: InkWell(
                    onTap: () {
                      //Handle onTap Event
                      Navigator.pushNamed(context, RouteName.faq);
                    },
                    child:  Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Add your row content here
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0,top: 10.0),
                            child: Container(
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.lightPink2,
                              ),
                              child: SvgPicture.asset(
                                AppAssets.messageQuestion, // Provide your asset path here
                                width: 20, // Adjust width as needed
                                height: 20, // Adjust height as needed
                              ),
                            ),
                          ),
                          TextBody("Frequently Asked Questions"),
                          SvgPicture.asset(
                            AppAssets.forwardArrow
                          )
                        ],

                      ),
                    ),
                  )
              ),

              const Gap(10),

              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: AppColors.lightGrey),
                  ),
                  child: InkWell(
                    onTap: () {
                      //Handle onTap Event
                    },
                    child:  Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Add your row content here
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0,top: 10.0),
                            child: Container(
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.lightPink2,
                              ),
                              child: SvgPicture.asset(
                                AppAssets.messageText, // Provide your asset path here
                                width: 20, // Adjust width as needed
                                height: 20, // Adjust height as needed
                              ),
                            ),
                          ),
                          TextBody("Contact Us"),
                          SvgPicture.asset(
                              AppAssets.forwardArrow
                          )
                        ],

                      ),
                    ),
                  )
              ),

              const Gap(10),

              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: AppColors.lightGrey),
                  ),
                  child: InkWell(
                    onTap: () {
                      //Handle onTap Event
                    },
                    child:  Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Add your row content here
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0,top: 10.0),
                            child: Container(
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.lightPink2,
                              ),
                              child: SvgPicture.asset(
                                AppAssets.messageText, // Provide your asset path here
                                width: 20, // Adjust width as needed
                                height: 20, // Adjust height as needed
                              ),
                            ),
                          ),
                          TextBody("Submit Complaint"),
                          SvgPicture.asset(
                              AppAssets.forwardArrow
                          )
                        ],

                      ),
                    ),
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}

