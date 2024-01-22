import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int notificationCount=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Column(
            children: [
              const Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height:50,
                          width:50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.editPersonColor,
                          ),
                          child:Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              AppAssets.user,
                              color: AppColors.textColor,
                            ),
                          ),
                
                        ),
                        const Gap(3),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextSmall('My location'),
                            const Gap(2),
                            Row(
                              children: [
                                TextSmall(
                                    '23 Chicago street, Abuja',
                                  fontWeight: FontWeight.w500,
                                ),
                                const Gap(3),
                                SvgPicture.asset(
                                  AppAssets.arrowDown
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            AppAssets.bell,
                          ),
                          onPressed: () {
                
                          },
                        ),
                        if (notificationCount > 0)
                          Positioned(
                            right: 8, top: 8,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              child: SvgPicture.asset(
                                AppAssets.dot,
                              ),
                  ),
                ),
                          ],
                        ),
                  ],
                ),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.lightPrimaryBackground,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextBold(
                        'Welcome to Shipoka',
                        fontSize: 22,
                      ),
                      const Gap(10),
                      TextBody(
                        'Get started with seamless shipping! Create your first shipment now',
                      ),
                      Gap(20),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: TextBody('Create Shipment'),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
