import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                        'Contact Us',
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
                TextBody(
                    'How can we help you?',
                  fontSize: 16,
                ),
                TextSmall(
                  'We would love to hear from you',
                  fontWeight: FontWeight.w400,
                ),
                const Gap(10),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldBackground,
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(AppAssets.twoFour),
                            const Gap(10),
                            TextBody('Customer service')
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.opaquePink,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                              child: TextSmall(
                                  'Chat',
                                color: AppColors.primaryColor,
                                fontSize: 12,
                                fontWeight:FontWeight.w500,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(20),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldBackground,
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(AppAssets.twoFour),
                            const Gap(10),
                            TextBody('Email Address')
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.opaquePink,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                              child: TextSmall(
                                'Send mail',
                                color: AppColors.primaryColor,
                                fontSize: 12,
                                fontWeight:FontWeight.w500,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(20),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldBackground,
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(AppAssets.twoFour),
                            const Gap(10),
                            TextBody('Facebook')
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.opaquePink,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                              child: TextSmall(
                                'Follow us',
                                color: AppColors.primaryColor,
                                fontSize: 12,
                                fontWeight:FontWeight.w500,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(20),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldBackground,
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(AppAssets.twoFour),
                            const Gap(10),
                            TextBody('Instagram')
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.opaquePink,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                              child: TextSmall(
                                'Follow us',
                                color: AppColors.primaryColor,
                                fontSize: 12,
                                fontWeight:FontWeight.w500,
                              )),
                        )
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
