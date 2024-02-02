import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/app.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppAssets.alert),
            const Gap(20),
            TextBody('Delete delivery detail'),
            const Gap(10),
            Flexible(
              child: TextSmall(
                  'Are you sure you want to delete this detail? This action cannot be undone.',
                color: AppColors.textSecondaryColor,
                overflow: TextOverflow.visible,
                  textAlign: TextAlign.center
              ),

            ),
            const Gap(20),
            Row(
              children: [
                Expanded(
                    child:Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color:AppColors.radioColor)
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: TextBody(
                            'Cancel',
                          ),
                        ),
                      ),
                    )
                ),
                const Gap(10),
                Expanded(
                    child:GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.circular(8),

                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            child: TextBody(
                              'Delete',
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}