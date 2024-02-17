import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';

class ShipokaPolicies extends StatefulWidget {
  const ShipokaPolicies({super.key});

  @override
  State<ShipokaPolicies> createState() => _ShipokaPoliciesState();
}

class _ShipokaPoliciesState extends State<ShipokaPolicies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const AppBackButton(),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: TextSemiBold(
                            'Shipoka Policies',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(25),
                  TextBody(
                    '1. Type of Data We Collect',
                    fontSize: 16,
                  ),
                  Gap(10),
                  TextSmall(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam auctor, velit vitae dignissim varius, lorem purus scelerisque quam, ut pulvinar tellus velit laoreet velit. Maecenas in convallis dui. Morbi congue tortor justo, id aliquet mi scelerisque sed. Sed vestibulum turpis et erat volutpat, et scelerisque velit molestie. Donec sodales enim non sagittis lacinia. Fusce dictum elit et justo vehicula lacinia. Nunc ac viverra nulla. Aliquam sed semper nibh. Cras egestas auctor luctus.',
                    maxLines: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  Gap(20),
                  TextBody(
                    '2. Use of Your Personal Data',
                    fontSize: 16,
                  ),
                  Gap(10),
                  TextSmall(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam auctor, velit vitae dignissim varius, lorem purus scelerisque quam, ut pulvinar tellus velit laoreet velit. Maecenas in convallis dui. Morbi congue tortor justo, id aliquet mi scelerisque sed. Sed vestibulum turpis et erat volutpat, et scelerisque velit molestie. Donec sodales enim non sagittis lacinia. Fusce dictum elit et justo vehicula lacinia. Nunc ac viverra nulla. Aliquam sed semper nibh. Cras egestas auctor luctus.',
                    maxLines: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  Gap(20),
                  TextBody(
                    '3. Disclosure of Your Personal Data',
                    fontSize: 16,
                  ),
                  Gap(10),
                  TextSmall(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam auctor, velit vitae dignissim varius, lorem purus scelerisque quam, ut pulvinar tellus velit laoreet velit. Maecenas in convallis dui. Morbi congue tortor justo, id aliquet mi scelerisque sed. Sed vestibulum turpis et erat volutpat, et scelerisque velit molestie. Donec sodales enim non sagittis lacinia. Fusce dictum elit et justo vehicula lacinia. Nunc ac viverra nulla. Aliquam sed semper nibh. Cras egestas auctor luctus.',
                    maxLines: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),

          )),
    );
  }
}
