import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class SavedLocation extends StatelessWidget {
  const SavedLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(AppAssets.location),
          ),
        ),
        const Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextBody(
              'Joesph Jones',
              fontSize: 14,
            ),
            const Gap(3),
            TextSmall(
              '961 Townhall, Blue city Abuja, nigeria 90001',

            )
          ],
        )
      ],
    );
  }
}