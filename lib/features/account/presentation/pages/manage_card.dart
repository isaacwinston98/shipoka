import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';


class ManageCard extends StatelessWidget {
  const ManageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //const Gap(10),
                  const AppBackButton(),
                  TextSemiBold(
                    'My Cards',
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 50,
                    width: 50,
                    child: Text(''),
                  )
                ],
              ),
               Gap(20),
               TextBody(
                "Manage Cards",
              ),
               const Gap(
                 30,
              ),
              Column(
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Material(
                      elevation: 0,
                      color: AppColors.lightBackground,
                      borderRadius: BorderRadius.circular(24),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              width:30,
                                height:30,
                                fit:BoxFit.scaleDown,
                                AppAssets.masterCard,
                            ),
                            const Gap(
                               10,
                            ),
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextBody(
                                  "27872******* 6722",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff101828),
                                  ),
                                ),
                                TextSmall(
                                  "Mastercard",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff344054),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const Spacer(),
              BusyButton(
                  title: 'Add New Card',
                  onTap: (){
                    Navigator.pushNamed(context, RouteName.addNewCard);
                  })

            ],
          ),
        ),
      ),
    );
  }
}