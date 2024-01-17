import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({super.key});

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Column(
              children: [
                const Gap(10),
                Row(
                  children: [
                    const AppBackButton(),
                    const Gap(20),
                    TextSemiBold(
                        'Setup Your Profile',
                      fontSize: 20,
                    ),


                  ],
                ),
                const Gap(25),
                Flexible(
                  child: TextSmall(
                    'Choose Your Shipoka App Experience: Tailor Your Profile to Your Needs',
                    fontSize: 14,
                    color: AppColors.smallTextColor,
                    fontWeight: FontWeight.w400,

                  ),
                ),
                const Gap(30),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightBackground,
                    borderRadius: BorderRadius.circular(20.0), // Set the border radius for curved corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(AppAssets.shop),
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextSemiBold(
                                  'For my Business',
                                fontSize: 16,
                              ),
                              const Gap(5),
                              TextSmall(
                                'Boost Your Business: Send Packages to Your Valued Customers Now',
                                fontSize: 12,
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(30),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightBackground,
                    borderRadius: BorderRadius.circular(20.0), // Set the border radius for curved corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(AppAssets.box),
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextSemiBold(
                                'For personal use',
                                fontSize: 16,
                              ),
                              const Gap(5),
                              TextSmall(
                                'Send Packages to Loved Ones or Yourself with a Click of a Button!',
                                fontSize: 12,
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],

            ),
          )
      ),
    );
  }
}
