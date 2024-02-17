import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class Packages extends StatefulWidget {
  final bool cancel;
  const Packages({
    super.key,
    required this.cancel
  });

  @override
  State<Packages> createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  @override
  Widget build(BuildContext context) {
    int? selectedValue;

    return Container(
      decoration:BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextSmall('Package 1'),
                widget.cancel?
                    GestureDetector(
                      onTap: (){
                        showModalBottomSheet(
                          showDragHandle: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)
                                )
                            ),
                            context: context,
                            builder: (BuildContext context){
                              SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                                statusBarColor: Colors.transparent, // Change this to your preferred status bar color
                              ));
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.34,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  TextSemiBold(
                                                    'Delivery Option',
                                                    fontSize: 17,
                                                  ),
                                                ],
                                              ),
                                              const Gap(20),
                                              const Divider(
                                                height: 1,
                                                color: AppColors.dividerGrey,
                                              ),
                                              Gap(10),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  TextBody(
                                                    'Please select an option below:',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  const Gap(20),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Radio(
                                                        visualDensity: const VisualDensity(
                                                          horizontal: VisualDensity.minimumDensity,
                                                          vertical: VisualDensity.minimumDensity,
                                                        ),
                                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        value: 1,
                                                        groupValue: selectedValue,
                                                        fillColor: MaterialStateColor.resolveWith(
                                                              (Set<MaterialState> states) {
                                                            if (states.contains(MaterialState.selected)) {
                                                              return AppColors.primaryColor; // Color when selected
                                                            }
                                                            return AppColors.radioColor; // Color when not selected
                                                          },
                                                        ),
                                                        onChanged: (value) {
                                                          setState(() {
                                                            selectedValue = value;
                                                          });
                                                        },
                                                      ),
                                                      const Gap(10),
                                                      TextBody(
                                                        'Return Package to Pickup Location',
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ],
                                                  ),
                                                  Gap(10),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Radio(
                                                        visualDensity: const VisualDensity(
                                                          horizontal: VisualDensity.minimumDensity,
                                                          vertical: VisualDensity.minimumDensity,
                                                        ),
                                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        value: 2,
                                                        groupValue: selectedValue,
                                                        fillColor: MaterialStateColor.resolveWith(
                                                              (Set<MaterialState> states) {
                                                            if (states.contains(MaterialState.selected)) {
                                                              return AppColors.primaryColor; // Color when selected
                                                            }
                                                            return AppColors.radioColor; // Color when not selected
                                                          },
                                                        ),
                                                        onChanged: (value) {
                                                          setState(() {
                                                            selectedValue = value;
                                                          });
                                                        },
                                                      ),
                                                      const Gap(10),
                                                      TextBody(
                                                        'Change Delivery Location',
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height:50,
                                                decoration: BoxDecoration(
                                                    color: AppColors.buttonPink,
                                                    borderRadius: BorderRadius.circular(40)),
                                                child: Expanded(
                                                  child: Center(
                                                    child: TextBody(
                                                      "Cancel",
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Gap(10),
                                            Expanded(
                                              child: Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    color: AppColors.primaryColor,
                                                    borderRadius: BorderRadius.circular(40)),
                                                child: Expanded(
                                                  child: Center(
                                                    child: TextBody(
                                                      "Submit",
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Gap(
                                              20,
                                            ),
                                            // Expanded(
                                            //     child: GestureDetector(
                                            //       onTap: () {
                                            //       },
                                            //       child: Container(
                                            //         height: 57,
                                            //         decoration: BoxDecoration(
                                            //             color:AppColors.primaryColor,
                                            //             borderRadius: BorderRadius.circular(40)),
                                            //         child: Center(
                                            //           child: TextBody(
                                            //             "Submit",
                                            //             color: AppColors.white,
                                            //
                                            //           ),
                                            //         ),
                                            //       ),
                                            //     )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                        );
                      },
                      child: TextSmall(
                          'Cancel Delivery',
                        color: AppColors.red,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                    : Container(),
              ],
            ),
            const Gap(5),
            const Divider(
              height: 1,
              color: AppColors.greyBorderColor,
            ),
            const Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextBody(
                        'Playstation 2023 Edition',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),

                  ],
                ),
                Row(
                  children: [
                    TextBody(
                        'Electronics',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                    const Gap(5),
                    const Gap(10),
                    SvgPicture.asset(
                      width: 15,
                        height: 15,
                        AppAssets.forwardRight,
                        fit:BoxFit.scaleDown
                    ),
                    const Gap(3),
                    TextBody(
                        '10KG',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),

                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}