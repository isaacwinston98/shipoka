import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/app.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';
import 'package:shipoka/features/home/presentation/widgets/current_shipment.dart';
import 'package:shipoka/features/home/presentation/widgets/packageTile.dart';
import 'package:shipoka/features/home/presentation/widgets/welcome.dart';

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
      backgroundColor: AppColors.textFieldBackground,
      body: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  const Gap(20),
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
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  AppAssets.user,
                                  height: 23,
                                  width: 23,
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
                                height: 20,
                                width: 20,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, RouteName.createShipment);
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
                  const CurrentShipment(),

                ],
              ),
              const Gap(20),
              Expanded(
                  child: Container(
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: AppColors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:15,vertical: 20 ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextSemiBold(
                                  'Recent Shipment',
                                  fontSize: 14,
                                  color: AppColors.homeTextColor,
                                ),
                                TextSmall(
                                  'View more',
                                  fontSize: 13,
                                  color: AppColors.smallTextColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          const Gap(15),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.textFieldBackground
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextSmall(
                                    'Enter Tracking ID',
                                    color: AppColors.personalProfileHint,
                                  ),
                                  SvgPicture.asset(AppAssets.search),
                                ],
                              ),
                            ),
                          ),
                         const Gap(10),
                          const Expanded(
                            child: SingleChildScrollView(
                             child: Column(
                               children: [
                                 PackageTile(),
                                 PackageTile(),
                                 PackageTile(),
                                 PackageTile(),
                                 PackageTile(),PackageTile(),
                                 PackageTile(),
                                 PackageTile(),


                               ],
                             ),
                                                     ),
                          )

                        ],
                      ),
                    ),
                  ))
            ],
          )
      ),
    );
  }
}



