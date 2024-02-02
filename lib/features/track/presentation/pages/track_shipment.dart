import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class TrackShipment extends StatefulWidget {
  const TrackShipment({super.key});

  @override
  State<TrackShipment> createState() => _TrackShipmentState();
}

class _TrackShipmentState extends State<TrackShipment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //const Gap(10),
                    const AppBackButton(),
                    TextSemiBold(
                      'Shipments',
                      fontSize: 20,
                    ),
                    const SizedBox(
                      height: 50,
                      width: 50,
                      child: Text(''),
                    )
                  ],
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: TextField(
                    cursorColor:AppColors.primaryColor,
                    decoration: InputDecoration(
                      hintText: 'Enter tracking ID',
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                        width: 1, color: AppColors.primaryColor,
                    ),
                  ),
                    enabledBorder:   OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(width: 1, color: AppColors.textFieldBackground),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:const BorderSide(
                      color: AppColors.primaryColor, // Set your desired border color here
                    ),
                  ),

                  filled: true,
                  fillColor: AppColors.textFieldBackground, // Set your desired background color here
                  suffixIcon: SvgPicture.asset(
                      AppAssets.searchStatus,
                    width: 10,
                    height: 20,
                      fit: BoxFit.scaleDown
                  ),
                ),
              ),
            ),
                DefaultTabController(
                    length: 4,
                    child: Column(
                      children: [
                        Material(
                          child: Container(
                            height: 55,
                            color: Colors.white,
                            child: TabBar(
                              physics: const ClampingScrollPhysics(),
                           // padding: const EdgeInsets.only(top: 10,bottom: 10,right: 0,left: 0),
                              unselectedLabelColor: AppColors.smallTextColor,
                              // indicatorSize: TabBarIndicatorSize.label,
                              // indicator: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(12),
                              //   color: AppColors.primaryColor
                              // ),
                              tabs: [
                                Tab(
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Text('All')),
                                ),
                                Tab(
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Text('Pending'),),
                                ),
                                Tab(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text('On Delivery'),),
                                ),
                                Tab(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text('Delivered'),),
                                ),

                              ],

                            ),
                          ),
                        )
                      ],
                    ),
                )
              ],
            ),
          ),
      ),
    );
  }
}
