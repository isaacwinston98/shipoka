import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Gap(10),
                  const AppBackButton(),
                  TextSemiBold(
                    'My Orders',
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
              TextBody('Today'),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColors.orderColor,
                          shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AppAssets.order),
                        ),
                      ),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Shipping ID: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '1257FTHS',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ]
                              ),
                          ),
                          const Gap(5),
                          TextSmall('13 Oct. 14:33'),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          '₦5,000',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight: FontWeight.w500// Adjust the font size as needed
                        ),
                      ),
                      TextSmall(
                          'Completed',
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )
                ],
              ),
              const Gap(15),
              const Divider(
                height: 1,
                color: AppColors.dividerGrey,
              ),
              const Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: AppColors.orderColor,
                            shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AppAssets.order),
                        ),
                      ),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Shipping ID: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '1257FTHS',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ]
                            ),
                          ),
                          const Gap(5),
                          TextSmall('13 Oct. 14:33'),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₦0',
                        style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w500// Adjust the font size as needed
                        ),
                      ),
                      TextSmall(
                        'Order Cancelled',
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )
                ],
              ),
              const Gap(15),
              const Divider(
                height: 1,
                color: AppColors.dividerGrey,
              ),
              const Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: AppColors.orderColor,
                            shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AppAssets.order),
                        ),
                      ),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Shipping ID: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '1257FTHS',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ]
                            ),
                          ),
                          const Gap(5),
                          TextSmall('13 Oct. 14:33'),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₦500',
                        style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w500// Adjust the font size as needed
                        ),
                      ),
                      TextSmall(
                        'Order Cancelled',
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )
                ],
              ),
              const Gap(15),
              const Divider(
                height: 1,
                color: AppColors.dividerGrey,
              ),
              const Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: AppColors.orderColor,
                            shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AppAssets.order),
                        ),
                      ),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Shipping ID: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '1257FTHS',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ]
                            ),
                          ),
                          const Gap(5),
                          TextSmall('13 Oct. 14:33'),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₦0',
                        style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w500// Adjust the font size as needed
                        ),
                      ),
                      TextSmall(
                        'Order Cancelled',
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )
                ],
              ),
              const Gap(15),
              const Divider(
                height: 1,
                color: AppColors.dividerGrey,
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: AppColors.orderColor,
                            shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AppAssets.order),
                        ),
                      ),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Shipping ID:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '1257FTHS',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ]
                            ),
                          ),
                          const Gap(5),
                          TextSmall('13 Oct. 14:33'),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₦5,000',
                        style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w500// Adjust the font size as needed
                        ),
                      ),
                      TextSmall(
                        'Order Cancelled',
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
