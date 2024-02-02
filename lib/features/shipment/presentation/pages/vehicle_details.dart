import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class VehicleDetails extends StatefulWidget {
  const VehicleDetails({super.key});

  @override
  State<VehicleDetails> createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  int? deliveryDestination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const Gap(10),
                        Row(
                          children: [
                            const AppBackButton(),
                            const Gap(20),
                            TextSemiBold(
                              'Vehicles Details',
                              fontSize: 20,
                            ),
                          ],
                        ),
                        const Gap(20),
                        const Divider(
                          height: 1,
                          color: AppColors.dividerGrey,
                        ),
                        const Gap(10),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: SvgPicture.asset(AppAssets.truckFast),
                                      ),
                                    ),
                                    const Gap(10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextBody(
                                          'Bike',
                                        ),
                                        const Gap(5),
                                        TextSmall('Standard')
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '\u20A6', // Unicode character for Naira sign
                                          style: GoogleFonts.notoSans(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        
                                        ),
                                        TextBody(
                                            '12,300',
                                          fontSize: 16.0,
                                        ),
                                      ],
                                    ),

                                    const Gap(15),
                                    Radio(
                                      visualDensity: const VisualDensity(
                                        horizontal: VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      value: 1,
                                      groupValue: deliveryDestination,
                                      fillColor: MaterialStateColor.resolveWith(
                                            (Set<MaterialState> states) {
                                          if (states.contains(MaterialState.selected)) {
                                            return AppColors.primaryColor; // Color when selected
                                          }
                                          return AppColors.radioColor; // Color when not selected
                                        },
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          deliveryDestination = value;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const Gap(10),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: SvgPicture.asset(AppAssets.truck),
                                      ),
                                    ),
                                    const Gap(10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextBody(
                                          'Car',
                                        ),
                                        const Gap(5),
                                        TextSmall('Deluxe')
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '\u20A6', // Unicode character for Naira sign
                                          style: GoogleFonts.notoSans(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),

                                        ),
                                        TextBody(
                                          '30,000',
                                          fontSize: 16.0,
                                        ),
                                      ],
                                    ),

                                    const Gap(15),
                                    Radio(
                                      visualDensity: const VisualDensity(
                                        horizontal: VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      value: 2,
                                      groupValue: deliveryDestination,
                                      fillColor: MaterialStateColor.resolveWith(
                                            (Set<MaterialState> states) {
                                          if (states.contains(MaterialState.selected)) {
                                            return AppColors.primaryColor; // Color when selected
                                          }
                                          return AppColors.radioColor; // Color when not selected
                                        },
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          deliveryDestination = value;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Gap(10),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: SvgPicture.asset(AppAssets.truckFast),
                                      ),
                                    ),
                                    Gap(10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextBody(
                                          'Mini Van',
                                        ),
                                        Gap(5),
                                        TextSmall('Premium')
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '\u20A6', // Unicode character for Naira sign
                                          style: GoogleFonts.notoSans(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),

                                        ),
                                        TextBody(
                                          '50,300',
                                          fontSize: 16.0,
                                        ),
                                      ],
                                    ),

                                    Gap(15),
                                    Radio(
                                      visualDensity: const VisualDensity(
                                        horizontal: VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      value: 3,
                                      groupValue: deliveryDestination,
                                      fillColor: MaterialStateColor.resolveWith(
                                            (Set<MaterialState> states) {
                                          if (states.contains(MaterialState.selected)) {
                                            return AppColors.primaryColor; // Color when selected
                                          }
                                          return AppColors.radioColor; // Color when not selected
                                        },
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          deliveryDestination = value;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: BusyButton(
                  title: 'Proceed',
                  onTap: () { },
                  disabled: true,
                ),
              ),
            ],
          ) ),
    );
  }
}
