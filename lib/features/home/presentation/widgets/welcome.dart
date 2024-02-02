import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';

class Welcome extends StatelessWidget {
  const Welcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.lightPrimaryBackground,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextBold(
                'Welcome to Shipoka!',
                fontSize: 22,
              ),
              const Gap(5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextSmall(
                  'Get started with seamless shipping! Create your first shipment now',
                  color: AppColors.smallTextColor,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,

                ),
              ),
              const Gap(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: TextBody(
                        'Create Shipment',
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}