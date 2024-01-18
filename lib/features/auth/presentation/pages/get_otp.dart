import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/core/navigator/route_name.dart';



class GetOTP extends StatefulWidget {
  const GetOTP({super.key});

  @override
  State<GetOTP> createState() => _GetOTPState();
}

class _GetOTPState extends State<GetOTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(10),
                Row(
                  children: [
                    const AppBackButton(),
                    const Gap(20),
                    TextSemiBold(
                      'Security Verification',
                      fontSize: 20,
                    ),
                  ],
                ),
                const Gap(48),
                TextBody(
                    'Phone Number Verification',
                  color: AppColors.smallTextColor,
                  fontSize: 16,
                ),
                const Gap(9),
                Flexible(
                  child: RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'An OTP  will be sent to this number ',
                          style: TextStyle(
                              color: AppColors.textSecondaryColor
                          ),
                        ),
                        TextSpan(
                          text: '0910*** 89 ',
                          style: TextStyle(
                              color: AppColors.textColor
                          ),
                        ),
                        TextSpan(
                            text: 'to verify your identity and ensure the security of your account.',
                          style: TextStyle(
                              color: AppColors.textSecondaryColor
                          ),
                        ),
                      ],
                    ),
                ),
                ),
                const Gap(27),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextSmall(
                      'Use Another Number? ',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.smallTextColor,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RouteName.changePhoneNumber);
                      },
                      child: TextSmall(
                        'Change Phone Number',
                        color: AppColors.primaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Gap(35),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: BusyButton(
                    title: 'Get OTP',
                    onTap: () {

                    },
                    // disabled: !canSubmit,
                  ),
                ),
              ],

            ),
          )
      ),
    );
  }
}
