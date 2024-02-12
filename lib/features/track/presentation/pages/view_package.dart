import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/features/track/presentation/widgets/packages.dart';

class ViewPackage extends StatefulWidget {
  const ViewPackage({super.key});

  @override
  State<ViewPackage> createState() => _ViewPackageState();
}

class _ViewPackageState extends State<ViewPackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
          child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 15),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  //const Gap(10),
                  const AppBackButton(),
                  TextSemiBold(
                    'View Package',
                    fontSize: 20,
                  ),
                ],
              ),
              const Gap(20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBody(
                        'Shipping to',
                        fontWeight: FontWeight.w400,
                        
                      ),
                      const Gap(5),
                      TextBody('Joseph Jones'),
                      const Gap(5),
                      TextSmall('23 Chicago street, Gwarinpa, Abuja')
                    ],
                  ),
                ),
              ),
              const Gap(15),
              TextSemiBold(
                  'Packages',
                fontSize: 16,
              ),
              const Gap(15),
              const Packages(cancel: true,),
              const Gap(10),
              const Packages(cancel: false,),
              const Gap(10),
              const Packages(cancel: true,),


            ],
          ),
          )
      ),
    );
  }
}


