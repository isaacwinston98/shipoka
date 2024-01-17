import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.lightBackground,
      ),
      child: Padding(
        padding: EdgeInsets.zero,
        child: Center(
          child: SvgPicture.asset(
            AppAssets.arrowBack,
          ),
        ),
      ),
    );
  }
}
