import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/app/view/widget/busy_button2.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //const Gap(10),
                          const AppBackButton(),
                          TextSemiBold(
                            'My Account',
                            fontSize: 20,
                          ),
                          const SizedBox(
                            height: 50,
                            width: 50,
                            child: Text(''),
                          )
                        ],
                      ),
                      const Gap(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height:110,
                                  width:110,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.editPersonColor,
                                  ),
                                  child:Image.asset(AppAssets.cat),
                                ),
                                const Gap(15),
                                TextSemiBold(
                                    'Andrew Jones',
                                  fontSize: 18,
                                ),
                                const Gap(3),
                                TextSmall('Andrew@email.com')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(15),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, RouteName.packageReturn);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: AppColors.white
                      ),
                      child:  Column(
                        children: [
                          const Gap(15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(AppAssets.person),
                                    const Gap(10),
                                    TextBody(
                                        'Profile Settings',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(AppAssets.forwardRight),
                              ],
                            ),
                          ),
                          const Gap(15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        AppAssets.address,
                                    ),
                                    const Gap(10),
                                    TextBody(
                                      'Addresses',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(AppAssets.forwardRight),
                              ],
                            ),
                          ),
                          const Gap(10),
                          const Divider(
                            height: 1,
                            color: AppColors.dividerGrey,
                          ),
                          const Gap(10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.greyBox,
                                    ),
                                    const Gap(10),
                                    TextBody(
                                      'My Shipments',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(AppAssets.forwardRight),
                              ],
                            ),
                          ),
                          const Gap(10),
                          const Divider(
                            height: 1,
                            color: AppColors.dividerGrey,
                          ),
                          const Gap(10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.payment,
                                    ),
                                    const Gap(10),
                                    TextBody(
                                      'Payment',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(AppAssets.forwardRight),
                              ],
                            ),
                          ),
                          const Gap(10),
                          const Divider(
                            height: 1,
                            color: AppColors.dividerGrey,
                          ),
                          const Gap(10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, RouteName.manageCard);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppAssets.myCard,
                                      ),
                                      const Gap(10),
                                      TextBody(
                                        'My Cards',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset(AppAssets.forwardRight),
                                ],
                              ),
                            ),
                          ),
                          const Gap(10),
                          const Divider(
                            height: 1,
                            color: AppColors.dividerGrey,
                          ),
                          const Gap(10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.history,
                                    ),
                                    const Gap(10),
                                    TextBody(
                                      'My Order History',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(AppAssets.forwardRight),
                              ],
                            ),
                          ),
                          const Gap(10),


                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: AppColors.white
                    ),
                    child:  Column(
                      children: [
                        const Gap(15),

                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.security,
                                  ),
                                  const Gap(10),
                                  TextBody(
                                    'Security',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                              SvgPicture.asset(AppAssets.forwardRight),
                            ],
                          ),
                        ),
                        const Gap(10),
                        const Divider(
                          height: 1,
                          color: AppColors.dividerGrey,
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.document,
                                  ),
                                  const Gap(10),
                                  TextBody(
                                    'Legal',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                              SvgPicture.asset(AppAssets.forwardRight),
                            ],
                          ),
                        ),
                        const Gap(10),
                        const Divider(
                          height: 1,
                          color: AppColors.dividerGrey,
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.helpCenter,
                                  ),
                                  const Gap(10),
                                  TextBody(
                                    'Help Center',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                              SvgPicture.asset(AppAssets.forwardRight),
                            ],
                          ),
                        ),
                        const Gap(20),

                      ],
                    ),
                  ),
                ),
                const Gap(15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: (){
                      logOut(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: AppColors.white
                      ),
                      child:  Column(
                        children: [
                          const Gap(10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        color:AppColors.textFieldBackground,
                                        shape: BoxShape.circle,),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: SvgPicture.asset(
                                          AppAssets.logOut,
                                        ),
                                      ),
                                    ),
                                    const Gap(10),
                                    TextBody(
                                      'Logout',
                                      color: AppColors.textRed,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(AppAssets.forwardRight),
                              ],
                            ),
                          ),
                          const Gap(10),
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(15)
              ],
            ),
          )
      ),
    );
  }
}

void logOut(BuildContext context) {
  showModalBottomSheet(
      shape:  const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
          )
      ),
      context: context,
      builder: (BuildContext context){
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // Change this to your preferred status bar color
        ));
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextSemiBold(
                      'Logout',
                      fontWeight: FontWeight.w500,
                      fontSize: 22,

                    ),
                    const Gap(10),
                    const Divider(
                      height: 1,
                      color: AppColors.dividerGrey,
                    ),
                    const Gap(30),
                    TextBody(
                        'Are you sure you want to logout?',
                      fontWeight: FontWeight.w500,
                    ),
                    const Gap(20),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 48,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.buttonPink
                            ),
                            child: Center(
                              child: TextBody(
                               'Cancel',
                                color: AppColors.black,
                                style: const TextStyle(
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ),
                    const Gap(10),
                    Expanded(
                        child: BusyButton(
                          color: AppColors.red,
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.login);
                          },
                          title: 'Yes, Logout!',

                        )
                    ),

                  ],
                )
              ],
            ),
          ),
        );
      }
  );
}
