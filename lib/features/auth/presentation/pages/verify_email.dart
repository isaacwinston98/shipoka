import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(10),
                        TextSemiBold(
                          'OTP Verification',
                          fontSize: 22,
                        ),
                        const Gap(48),
                        TextBody(
                          'Email Verification',
                          color: AppColors.smallTextColor,
                          fontSize: 16,
                        ),
                        const Gap(5),
                        TextSmall(
                          'Please enter the 6-digit verification code that was sent to Jerr*****mail.com. The code is valid for 30 minutes.',
                        ),
                        const Gap(30),
                        SizedBox(
                          height: 60,
                          child: OtpTextField(
                            borderRadius: const BorderRadius.all(Radius.circular(7)),
                            numberOfFields: 6,
                            fieldWidth: 45,
                            focusedBorderColor:AppColors.primaryColor,
                            showFieldAsBox: true,
                            cursorColor:AppColors.primaryColor,
                            textStyle: const TextStyle(
                              color: AppColors.textSecondaryColor,
                              fontSize: 20,
                            ),
                            onCodeChanged: (String code) {
                            },
                          ),
                        ),
                        const Gap(60),
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
                  )),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: BusyButton(
                  title: 'Continue',
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.signUp);
                    // Provider.of<AuthNotifier>(context, listen: false)
                    //     .register(
                    //   context,
                    //   firstName: firstNameController.text.trim(),
                    //   lastName: surnameController.text.trim(),
                    //   email: emailController.text.trim(),
                    //   countryCode: 'NG',
                    //   pin: pinController.text.trim(),
                    //   phoneNumber: phoneController.text.trim(),
                    // );
                  },
                  // disabled: !canSubmit,
                ),
              ),
            ],
          ),
        ) ,
      ),
    );
  }
}
