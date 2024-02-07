import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class PackageTile extends StatelessWidget {
  const PackageTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.textFieldBackground
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.lightPink2,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      AppAssets.boxed,
                    ),
                  ),
                ),
                const Gap(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBody(
                      '123GHT56',
                      fontSize: 15,
                    ),
                    const Gap(3),
                    Row(
                      children: [
                        TextSmall(
                            'Gwarimpa'
                        ),
                        const Gap(5),
                        SvgPicture.asset(
                          AppAssets.arrowRight,
                        ),
                        const Gap(5),
                        TextSmall(
                            'Karu'
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            SvgPicture.asset(
                AppAssets.forwardRight
            )
          ],
        ),
      ),
    );
  }
}