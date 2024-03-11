import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class HomeScreenTwo extends StatefulWidget {
  const HomeScreenTwo({super.key});

  @override
  State<HomeScreenTwo> createState() => _HomeScreenTwoState();
}

class _HomeScreenTwoState extends State<HomeScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.lighterGrey,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset(AppAssets.userNewTwo),
                                ),
                              ),
                              const Gap(5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextSmall('My location'),
                                  Row(
                                    children: [
                                      TextBody(
                                        '23 Chicago street, Abuja',
                                        fontSize: 12,
                                      ),
                                      const Gap(5),
                                      GestureDetector(
                                        onTap: () {},
                                        child: SvgPicture.asset(AppAssets.arrowDown),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      SvgPicture.asset('assets/icons/bell.svg'),
                    ],
                  ),
                  const Gap(20),
                  // Add the container with colored background, border radius, header text, text below, and button below
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.lightPrimaryBackground, // Change the color as needed
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextBold(
                          'Welcome to Shipoka!',
                          fontSize: 20,
                        ),
                        TextSmall(
                          'Get started with seamless shipping! Create your first shipment now',
                          fontSize: 13,
                          textAlign: TextAlign.center,
                        ),
                        const Gap(30),
                        SizedBox(
                          height: 40,
                          child: BusyButton(
                            title: 'Create Shipment',
                            onTap: () {},
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Gap(20),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.white, // Change the color as needed
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: BottomNavigationBar(
                      items: const [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.search),
                          label: 'Search',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.notifications),
                          label: 'Notifications',
                        ),
                      ],
                    ), // Close BottomNavigationBar
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
