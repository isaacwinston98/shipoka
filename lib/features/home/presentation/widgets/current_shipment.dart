
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';

class CurrentShipment extends StatelessWidget {
  const CurrentShipment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextSemiBold(
                    'Current Shipment',
                    fontSize: 14,
                    color: AppColors.homeTextColor,
                  ),
                  Container(
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.textFieldBackground
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 8),
                      child: TextSmall(
                        'Ongoing',
                        color: AppColors.lightBlue,
                      ),
                    ),
                  )
                ],
              ),
              const Gap(15),
              const Divider(
                height: 1,
                color: AppColors.dividerGrey,
              ),
              const Gap(15),
              TextBody(
                'Playstation 2023 Edition',
                color: AppColors.smallTextColor,
                fontSize: 14,
              ),
              const Gap(1),
              TextBody(
                '423TY278',
                color: AppColors.textSecondaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              const Gap(10),
              const LinearProgressIndicator(
                value: 0.3,
                color: AppColors.primaryColor,
                backgroundColor: AppColors.progressbarBackground,
                minHeight: 2,

              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextSmall(
                        '9:09am 11 Oct. 2023 ',
                        fontSize: 11,
                        color: AppColors.textSecondaryColor,
                      ),
                      const Gap(2),
                      TextBody(
                        'Gwarinpa',
                        fontSize: 12,
                        color: AppColors.smallTextColor,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextSmall(
                        '9:09am 11 Oct. 2023 ',
                        fontSize: 11,
                        color: AppColors.textSecondaryColor,
                      ),
                      const Gap(2),
                      TextBody(
                        'Karu',
                        fontSize: 12,
                        color: AppColors.smallTextColor,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

