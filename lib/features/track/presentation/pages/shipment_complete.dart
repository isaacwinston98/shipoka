import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';

import '../../../../app/styles/app_color.dart';

class ShipmentComplete extends StatefulWidget {
  const ShipmentComplete({super.key});

  @override
  State<ShipmentComplete> createState() => _ShipmentCompleteState();
}

class _ShipmentCompleteState extends State<ShipmentComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.white ,
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //const Gap(10),
                  const AppBackButton(),
                  TextSemiBold(
                    'Shipment Complete',
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 50,
                    width: 50,
                    child: Text(''),
                  ),

                ],
              ),
              Gap(15),
              TextBody(
                'Rate Driver',
              ),
              Gap(10),
              Row(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                           CircleAvatar(
                            child:Image.asset(AppAssets.man) ,
                          ),
                          Gap(10),
                          Column(
                            children: [
                              TextBody(
                                'Driver name',
                              ),
                              Gap(5),
                              TextBody(
                                'Vehicle Type',
                                fontWeight: FontWeight.w400,
                              )
                            ],
                          ),

                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppAssets.star),
                          Gap(5),
                          TextBody(
                              '5.0',
                            fontWeight: FontWeight.w400,
                          )

                        ],
                      ),
                      Gap(10),
                      TextBody(
                          'ABC 737 MK',
                      )
                    ],
                  )

                ],
              ),
              Gap(10),
              const Divider(
                height: 1,
                color: AppColors.dividerGrey,
              ),
              Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextBody(
                    'How is your driver?',
                    color: AppColors.textSecondaryColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ) ,

    );
  }
}
