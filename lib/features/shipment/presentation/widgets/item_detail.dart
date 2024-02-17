import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextBody(
                    'Package 1',
                    fontSize: 16,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                          AppAssets.reEdit,
                        width: 15,
                        height: 15,
                        fit: BoxFit.scaleDown,
                      ),
                      const Gap(20),
                      SvgPicture.asset(
                          AppAssets.trash,
                        width: 15,
                        height: 15,
                        fit: BoxFit.scaleDown,
                      ),
                    ],
                  )
                ],
              ),
              const Gap(4),
              const Divider(
                height: 1,
                color: AppColors.dividerGrey,
              ),
              const Gap(10),
              TextBody(
                'Playstation 2023 Edition',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.smallTextColor,
              ),
              const Gap(10),
              TextBody(
                'Electronics',
                fontWeight: FontWeight.w300,
                fontSize: 14,

              ),
              TextSmall('> 10kg')
            ],
          ),
        ),
      ),
    );
  }
}