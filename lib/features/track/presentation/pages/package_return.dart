import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';

import '../../../../app/styles/app_color.dart';


class PackageReturn extends StatefulWidget {
  const PackageReturn({super.key});

  @override
  State<PackageReturn> createState() => _PackageReturnState();
}

class _PackageReturnState extends State<PackageReturn> {
  int? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //const Gap(10),
                      const AppBackButton(),
                      TextSemiBold(
                        'Package Return',
                        fontSize: 20,
                      ),
                      const SizedBox(
                        height: 50,
                        width: 50,
                        child: Text(''),
                      )
                    ],
                  ),
                  const Gap(20),
                  TextSmall(
                      'Your Package is being returned',
                    fontSize: 14,
                    color: AppColors.textSecondaryColor,
                  ),
                  const Gap(10),
                  const Divider(
                    height: 1,
                    color: AppColors.dividerGrey,
                  ),
                  const Gap(20),
                  const InputField(
                    controller: null,
                    placeholder: 'Reason for return: Wrong Address',),
                  const Gap(25),
                  TextSmall(
                    'Return Option',
                    fontSize: 14,

                  ),
                  const Gap(10),
                  const Divider(
                    height: 1,
                    color: AppColors.dividerGrey,
                  ),
                  const Gap(25),
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
                      const Gap(5),
                      TextBody(
                        'Return to Pickup Location (Free)',
                        fontWeight: FontWeight.w500,
                      ),
                    ],
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
                      const Gap(5),
                      TextBody(
                        'Return to Another Destination',
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ),

      ),
    );
  }
}
