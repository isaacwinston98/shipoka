import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //const Gap(10),
                  const AppBackButton(),
                  TextSemiBold(
                    'Fund Wallet',
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
               TextSmall(
                "Choose a secure and convenient payment method to add funds to your wallet.",
                style: const TextStyle(fontSize: 12, color: Color(0xff344054)),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.lightBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration:BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              child: SvgPicture.asset(

                                AppAssets.bank,),
                            ),
                          ),
                          const Gap(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextBody(
                                'Bank Transfer',
                                fontWeight: FontWeight.w500,
                              ),
                              const Gap(2),
                              Text(
                                'Make your payment through bank transfer' , // Unicode character for Naira sign
                                style: GoogleFonts.dmSans(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w400,
                                ),
      
                              ),
                            ],
                          ),
      
                        ],
                      ),
                      SvgPicture.asset(
                        AppAssets.rightDir,),
      
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, RouteName.fundPayment);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.lightBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration:BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: SvgPicture.asset(
                                  AppAssets.card,),
                              ),
                            ),
                            const Gap(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextBody(
                                  'Pay with card',
                                  fontWeight: FontWeight.w500,
                                ),
                                const Gap(2),
                                Text(
                                  'Securely pay with your bank card' , // Unicode character for Naira sign
                                  style: GoogleFonts.dmSans(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w400,
                                  ),

                                ),
                              ],
                            ),

                          ],
                        ),
                        SvgPicture.asset(
                          AppAssets.rightDir,),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}