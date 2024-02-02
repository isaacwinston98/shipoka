import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/features/shipment/presentation/widgets/destination_item.dart';
import 'package:shipoka/features/shipment/presentation/widgets/item_detail.dart';

class DestinationList extends StatefulWidget {
  const DestinationList({super.key});

  @override
  State<DestinationList> createState() => _DestinationListState();
}

class _DestinationListState extends State<DestinationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textFieldBackground,
      body: SafeArea(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                color: AppColors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(10),
                          Row(
                            children: [
                              const AppBackButton(),
                              const Gap(20),
                              TextSemiBold(
                                'Pickup & Delivery Detail',
                                fontSize: 20,
                              ),
                            ],
                          ),
                          const Gap(20),
                          TextBody(
                            'Destination Details',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          const Gap(5),
                          TextSmall(
                            'Provide specific details for your destination',
                            fontSize: 12,
                          ),
                          const Gap(10),

                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.white,
                      ),
                      child:  SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              //UnComment this code to see "add another package
                              const DestinationItem(),
                              const DestinationItem(),
                              const DestinationItem(),
                              const Gap(20),
                              Container(),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(AppAssets.add),
                                    const Gap(5),
                                    TextBody(
                                      'Add Delivery Detail',
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                    const Gap(5),
                                  ],
                                ),
                              ),
                              const Gap(10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ), ),
    );
  }
}


