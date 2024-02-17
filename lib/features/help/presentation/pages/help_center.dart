import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppBackButton(),
                  Container(
                    alignment: Alignment.center,
                    child: TextSemiBold(
                      'Help Center',
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                    width: 10,
                    child: Text('    '),
                  ),



                ],
              ),
              Gap(20),
              TextBody(
                  'Welcome to our Help Center for quick and reliable support.'),
              Gap(15),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, RouteName.termsAndConditions);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColors.borderColor, // Set border color here
                      width: 1.0, // Set border width here
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.orderColor,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(AppAssets.faq),
                              ),
                            ),
                            const Gap(10),
                            TextBody(
                                'Frequently Asked Questions')
                          ],
                        ),
                        SvgPicture.asset(AppAssets.forwardRight)
                      ],
                    ),
                  ),
                ),
              ),
              Gap(15),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, RouteName.termsAndConditions);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColors.borderColor, // Set border color here
                      width: 1.0, // Set border width here
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.orderColor,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(AppAssets.file),
                              ),
                            ),
                            const Gap(10),
                            TextBody(
                                'Contact Us')
                          ],
                        ),
                        SvgPicture.asset(AppAssets.forwardRight)
                      ],
                    ),
                  ),
                ),
              ),
              Gap(15),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, RouteName.termsAndConditions);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColors.borderColor, // Set border color here
                      width: 1.0, // Set border width here
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.orderColor,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(AppAssets.file),
                              ),
                            ),
                            const Gap(10),
                            TextBody(
                                'Submit  complaint')
                          ],
                        ),
                        SvgPicture.asset(AppAssets.forwardRight)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
