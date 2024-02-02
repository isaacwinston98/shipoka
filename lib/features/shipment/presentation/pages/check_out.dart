import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
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
                     'Check out',
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

               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   TextBody('Amount summary'),
                 ],
               ),
               const Gap(10),
               const Divider(
                 height: 1,
                 color: AppColors.dividerGrey,
               ),
               const Gap(10),
               Container(
                 decoration: BoxDecoration(
                   color: AppColors.white,
                   borderRadius: BorderRadius.circular(12),
                 ),
                 child:  Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                   child: Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           TextBody(
                               'Destination 1',
                             fontWeight: FontWeight.w400,
                             color: AppColors.smallTextColor,
                           ),
                           Text(
                             '₦4500' , // Unicode character for Naira sign
                             style: GoogleFonts.notoSans(
                               fontSize: 14.0,
                               fontWeight: FontWeight.w500,

                             ),

                           ),
                         ],
                       ),
                       const Gap(13),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           TextBody(
                             'Destination 2',
                             fontWeight: FontWeight.w400,
                             color: AppColors.smallTextColor,
                           ),
                           Text(
                             '₦4500' , // Unicode character for Naira sign
                             style: GoogleFonts.notoSans(
                               fontSize: 14.0,
                               fontWeight: FontWeight.w500,
                             ),

                           ),
                         ],
                       ),
                       const Gap(13),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           TextBody(
                             'Destination 3',
                             fontWeight: FontWeight.w400,
                             color: AppColors.smallTextColor,
                           ),
                           Text(
                             '₦4500' , // Unicode character for Naira sign
                             style: GoogleFonts.notoSans(
                               fontSize: 14.0,
                               fontWeight: FontWeight.w500,
                             ),

                           ),
                         ],
                       ),
                       const Gap(13),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           TextBody(
                             'Other fees',
                             color: AppColors.smallTextColor,
                             fontWeight: FontWeight.w400,
                           ),
                           Text(
                             '₦300' , // Unicode character for Naira sign
                             style: GoogleFonts.notoSans(
                               fontSize: 14.0,
                               fontWeight: FontWeight.w500,
                             ),

                           ),
                         ],
                       ),
                       const Gap(13),
                       const Divider(
                         height: 1,
                         color: AppColors.dividerGrey,
                       ),
                       const Gap(10),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           TextBody(
                             'Total',
                             fontWeight: FontWeight.w500,
                           ),
                           Text(
                             '₦20,300' , // Unicode character for Naira sign
                             style: GoogleFonts.notoSans(
                               fontSize: 16.0,
                               fontWeight: FontWeight.w500,
                             ),

                           ),
                         ],
                       ),

                     ],
                   ),
                 ),
               ),
               const Gap(13),
               TextSemiBold('Payment Method'),
               const Gap(10),
               const Divider(
                 height: 1,
                 color: AppColors.dividerGrey,
               ),
               const Gap(10),
               Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(12),
                   color: AppColors.white,
                 ),
                 child:  Padding(
                   padding: const EdgeInsets.symmetric(horizontal:10,vertical: 20 ),
                   child: Column(
                     children: [
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
                                             AppAssets.wallet,),
                                     ),
                                   ),
                                   const Gap(10),
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       TextBody(
                                         'Shipoka Wallet',
                                         fontWeight: FontWeight.w500,
                                       ),
                                       const Gap(2),
                                       Text(
                                         '₦20,300' , // Unicode character for Naira sign
                                         style: GoogleFonts.notoSans(
                                           fontSize: 11.0,
                                           fontWeight: FontWeight.w400,

                                         ),

                                       ),
                                     ],
                                   ),

                                 ],
                               ),
                               Radio(
                                 visualDensity: const VisualDensity(
                                   horizontal: VisualDensity.minimumDensity,
                                   vertical: VisualDensity.minimumDensity,
                                 ),
                                 materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                 value: 1,
                                 groupValue: selectedValue,
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
                                     selectedValue = value;
                                   });
                                 },
                               ),

                             ],
                           ),
                         ),
                       ),
                       const Gap(10),
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
                                         AppAssets.boxTick,),
                                     ),
                                   ),
                                   const Gap(10),
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       TextBody(
                                         'Pay on Delivery',
                                         fontWeight: FontWeight.w500,
                                       ),
                                       const Gap(2),
                                       Text(
                                         'Create a payment link for the recipient.' , // Unicode character for Naira sign
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
                       const Gap(10),
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
                       const Gap(10),
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
                     ],
                   ),
                 ),
               )
             ],
            ),
          ),
        ) ,
      ),
    );
  }
}
