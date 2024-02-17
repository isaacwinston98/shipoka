import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class Legal extends StatefulWidget {
  const Legal({super.key});

  @override
  State<Legal> createState() => _LegalState();
}

class _LegalState extends State<Legal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppBackButton(),
                  Container(
                    alignment: Alignment.center,
                    child: TextSemiBold(
                      'Legal',
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                    width: 10,
                    child: Text('    '),
                  )

                ],
              ),
              const Gap(20),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, RouteName.shipokaPolicies);
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
                                'Shipoka Policies')
                          ],
                        ),
                        SvgPicture.asset(AppAssets.forwardRight)
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(15),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, RouteName.privacyPolicies);
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
                                'Privte Policies')
                          ],
                        ),
                        SvgPicture.asset(AppAssets.forwardRight)
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(15),
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
                                'Terms and conditions')
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
