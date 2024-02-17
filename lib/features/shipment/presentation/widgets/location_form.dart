import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';

import '../../../../app/view/widget/input_field.dart';

class LocationForm extends StatelessWidget {
  const LocationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.textFieldBackground
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextSmall(
                  'country/Region',
                  color: AppColors.personalProfileHint,
                ),
                const Icon(
                    Icons.arrow_drop_down_outlined
                ),
              ],
            ),
          ),
        ),
        const Gap(10),
        const InputField(
          placeholder: 'Address eg 123 kent street',
          textInputType: TextInputType.number,
          controller: null,
        ),
        const Gap(10),
        Row(
          children: [
            const Expanded(
              child:InputField(
                placeholder: 'City',
                textInputType: TextInputType.number,
                controller: null,
              ),
            ),
            const Gap(5),
            Expanded(
                child:Container(
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextSmall(
                          'State',
                          color: AppColors.personalProfileHint,
                        ),
                        const Icon(
                            Icons.arrow_drop_down_outlined
                        ),
                      ],
                    ),
                  ),
                )
            )
          ],
        )

      ],
    );
  }
}
