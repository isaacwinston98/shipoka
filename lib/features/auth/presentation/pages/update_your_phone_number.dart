import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';

class UpdateYourPhoneNumber extends StatefulWidget {
  const UpdateYourPhoneNumber({super.key});

  @override
  State<UpdateYourPhoneNumber> createState() => _UpdateYourPhoneNumberState();
}

class _UpdateYourPhoneNumberState extends State<UpdateYourPhoneNumber> {
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
                          'Update Your Phone Number',
                          fontSize: 22,
                        ),
                        const Gap(48),
                        TextBody(
                          'Phone Number Verification',
                          color: AppColors.smallTextColor,
                          fontSize: 16,
                        ),
                        const Gap(5),
                        TextSmall(
                            'A  code has been sent to the new phone number ending in ***89. Please enter the code below to complete the phone number change.',
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
                    //Navigator.pushNamed(context, RouteName.signUp);
                    _handleContinueButton();
                  },
                  // disabled: !canSubmit,
                  disabled: true,
                ),
              ),
            ],
          ),
        ) ,
      ),
    );
  }

  void _handleContinueButton() {
    // Implement the logic for setting new password

    // Assuming the password change is successful, show the success dialog
    _showSuccessDialog();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dialog dismissal on outside tap
      builder: (BuildContext context) {
        Timer(Duration(seconds: 3), () {
          Navigator.of(context).pop(); // Dismiss the dialog after 3 seconds
        });

        return GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pop(); // Dismiss the dialog on outer space tap
          },
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 30.0,),
                Image.asset(
                  'assets/images/passwordChangedImage.png',
                  // Replace with your image path
                  width: 170.0,
                  height: 170.0,
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Password Changed',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Your password reset is complete.'
                      ' You will be redirected to the home page in a few seconds.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 100.0),
              ],
            ),
            backgroundColor: Colors.white,
          ),
        );
      },
    );
  }
}
