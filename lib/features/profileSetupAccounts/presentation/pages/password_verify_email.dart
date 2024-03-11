import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/core/navigator/route_name.dart';



class PasswordVerifyEmail extends StatefulWidget {
  const PasswordVerifyEmail({super.key});

  @override
  State<PasswordVerifyEmail> createState() => _PasswordVerifyEmailState();
}

class _PasswordVerifyEmailState extends State<PasswordVerifyEmail> {

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
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                                child: AppBackButton(),
                              ),
                            ),
                            const SizedBox(width: 15.0,),
                            // Text at the center Top
                            Center(
                              child: TextSemiBold(
                                "Forgot Password",
                                style: TextStyle(
                                  fontSize: 19.0,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Gap(45),
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
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                    Navigator.pushNamed(context, RouteName.setNewPasswordTwo);
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
