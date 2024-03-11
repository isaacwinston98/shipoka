import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/core/navigator/route_name.dart';


class PersonalOtpVerificationTwo extends StatefulWidget {
  const PersonalOtpVerificationTwo({Key? key});

  @override
  State<PersonalOtpVerificationTwo> createState() => _PersonalOtpVerificationTwoState();
}

class _PersonalOtpVerificationTwoState extends State<PersonalOtpVerificationTwo> {
  String otpCode = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Text at the center Top
                      TextSemiBold(
                        "OTP Verification",
                        style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Gap(50),
                      TextBody(
                        'Email Verification',
                        color: AppColors.smallTextColor,
                        fontSize: 16,
                      ),
                      const Gap(5),
                      TextSmall(
                        'Please enter the 6-digit verification code that was sent to jerr***mail.com. The code is valid for 30 minutes.',
                      ),
                      const Gap(30),
                      SizedBox(
                        height: 60,
                        child: OtpTextField(
                          borderRadius: const BorderRadius.all(Radius.circular(7)),
                          numberOfFields: 6,
                          filled: true,
                          fillColor: AppColors.textFieldBackground,
                          fieldWidth: 45,
                          focusedBorderColor:AppColors.primaryColor,
                          showFieldAsBox: true,
                          cursorColor:AppColors.primaryColor,
                          textStyle: const TextStyle(
                            color: AppColors.textSecondaryColor,
                            fontSize: 20,
                          ),
                          onCodeChanged: (String code) {
                            setState(() {
                              otpCode = code;
                            });
                          },
                        ),
                      ),
                      const Gap(50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextSmall(
                            'Didn’t receive code? ',
                            color: AppColors.smallTextColor,
                          ),
                          TextSmall(
                            '59:23',
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: BusyButton(
                  title: 'Continue',
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.personalCreateNewPinTwo);
                  },
                  disabled: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
