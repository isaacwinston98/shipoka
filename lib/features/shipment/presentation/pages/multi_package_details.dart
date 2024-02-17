import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';
import 'package:shipoka/features/shipment/presentation/widgets/item_detail.dart';

class MultiPackageDetails extends StatefulWidget {
  const MultiPackageDetails({super.key});

  @override
  State<MultiPackageDetails> createState() => _MultiPackageDetailsState();
}

class _MultiPackageDetailsState extends State<MultiPackageDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.textFieldBackground,
      body: SafeArea(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
               // color: AppColors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                'Package Details',
                                fontSize: 20,
                              ),
                            ],
                          ),
                          const Gap(20),
                          TextBody(
                            'Please share information about your outgoing package',
                            fontWeight: FontWeight.w500,
                            color: AppColors.smallTextColor,
                          ),
                          const Gap(20),
                          const Divider(
                            height: 1,
                            color: AppColors.dividerGrey,
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
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              //UnComment this code to see "add another package


                              Gap(10),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: ItemDetail(),
                              ),
                              const Gap(20),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Gap(20),
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
                            'Add Another Package',
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                          const Gap(5),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: BusyButton(
                title: 'Continue',
                onTap: () {
                  Navigator.pushNamed(context, RouteName.homeScreen);
                },
                disabled: true,
              ),
            ),

          ],
        ), ),
    );
  }
}
