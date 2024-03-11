import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class SetupProfileTwo extends StatefulWidget {
  const SetupProfileTwo({super.key});

  @override
  State<SetupProfileTwo> createState() => _SetupProfileTwoState();
}

class _SetupProfileTwoState extends State<SetupProfileTwo> {
  bool container1Clicked = false;
  bool container2Clicked = false;

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled = container1Clicked || container2Clicked;

    return Scaffold(
      backgroundColor: AppColors.background,
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
                    "Setup Your Profile",
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Gap(20),
              TextSmall(
                "Choose Your Shipoka App Experience: Tailor Your Profile to Your Needs",
                fontSize: 12,
              ),
              const Gap(40),

              GestureDetector(
                onTap: () {
                  setState(() {
                    container1Clicked = !container1Clicked;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: container1Clicked ? AppColors.lightPink : AppColors.lightBackground,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: container1Clicked ? AppColors.primaryColor : Colors.transparent,
                      )
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white, // Set your desired color here
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.lightPink,
                                shape: BoxShape.circle
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(AppAssets.tee),
                            ),
                          ),
                        ), // Add your desired icon here
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextBody(
                              "For My Business",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(2),
                            TextSmall(
                              "boost Your Business: Send Packages to Your Valued Customers Now",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    container2Clicked = !container2Clicked;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: container2Clicked ? AppColors.lightPink : AppColors.lightBackground,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: container2Clicked ? AppColors.primaryColor : Colors.transparent,
                      )
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white, // Set your desired color here
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.lightPink,
                                shape: BoxShape.circle
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(AppAssets.shopTwo),
                            ),
                          ),
                        ), // Add your desired icon here
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextBody(
                              "For Personal Use",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(2),
                            TextSmall(
                              "Send Packages to Loved Ones or Yourself with a Click of a Button!",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: BusyButton(
                  title: 'Continue',
                  onTap: isButtonEnabled
                      ? () {
                    if (container1Clicked) {
                      // Navigate to the screen for business setup
                      Navigator.pushNamed(context, RouteName.businessSetUpProfile);
                    } else if (container2Clicked) {
                      // Navigate to the screen for personal setup
                      Navigator.pushNamed(context, RouteName.personalProfileTwo);
                    }
                  }
                      : () {}, // Provide an empty function when the button is disabled
                  disabled: !isButtonEnabled,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
