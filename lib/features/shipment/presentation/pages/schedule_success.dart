import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class ScheduleSuccess extends StatefulWidget {
  const ScheduleSuccess({super.key});

  @override
  State<ScheduleSuccess> createState() => _ScheduleSuccessState();
}

class _ScheduleSuccessState extends State<ScheduleSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:10,vertical: 20 ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Gap( MediaQuery.of(context).size.height * 0.01),
                            SvgPicture.asset(AppAssets.scheduleSuccess),
                            const Gap(15),
                            TextSemiBold(
                                'Shipment Scheduled',
                              fontSize: 20,
                            ),
                            const Gap(30),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.13 ),
                              child: Center(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(AppAssets.calender),
                                          const Gap(10),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSmall('Schedule date'),
                                              const Gap(5),
                                              TextBody('Tuesday, October 10'),
                                              const Gap(10),

                                            ],
                                          )
                                        ],
                                      ),
                                      const Gap(5),
                                      const Divider(
                                        height: 1,
                                        color: AppColors.dividerGrey,
                                      ),
                                      const Gap(5),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(AppAssets.clock),
                                          const Gap(10),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSmall('Pick-up time'),
                                              const Gap(5),
                                              TextBody('03:00PM'),
                                              const Gap(10),

                                            ],
                                          )
                                        ],
                                      ),
                                      const Gap(5),
                                      const Divider(
                                        height: 1,

                                        color: AppColors.dividerGrey,
                                      ),
                                      const Gap(5),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(AppAssets.timer),
                                          const Gap(10),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSmall('Countdown'),
                                              const Gap(5),
                                              TextSmall(
                                                '1 days 05 hours 15 minutes remaining',
                                                fontWeight: FontWeight.w500,
                                                maxLines: 3,
                                              ),
                                              const Gap(10),

                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Gap(30),
                            TextBody('Tracking ID:'),
                            const Gap(10),
                            TextSemiBold(
                                'A1B2C3',
                              fontSize: 22,
                            )
                          ],
                         ),
                       ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            child: BusyButton(
                              title: 'Done',
                              onTap: () {
                                Navigator.pushNamed(context, RouteName.setupProfile);
                              },
                             // disabled: !canSubmit,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            child: BusyButton(
                              color: AppColors.buttonPink,
                              title: 'Print Shipment label',
                              onTap: () {
                                Navigator.pushNamed(context, RouteName.setupProfile);
                              },
                              // disabled: !canSubmit,
                            ),
                          ),
                        ],
                      ),



                    ],
                  ),
          )),
    );
  }
}
