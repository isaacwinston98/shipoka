import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class SecurityVerificationTwo extends StatelessWidget {
  const SecurityVerificationTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      child: AppBackButton(),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  //Text at the center Top
                  TextSemiBold(
                    "Security Verification",
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Gap(40),
              TextBody('Phone Number Verification'),
              const Gap(10),
              TextSmall(
                  'An OTP  will be sent to this number  0910*** 89 to verify your identity'
                      ' and ensure the security of your account.',
              ),
              const Gap(20),
              Row(
                children: [
                  TextBody(
                      'Use Another Number?',
                    fontSize: 12,
                  ),
                  const SizedBox(width: 5,),
                  GestureDetector(
                    onTap: () {
                      // Handle the onTap event
                      // For example, you can navigate to another screen to change the phone number
                      Navigator.pushNamed(context, RouteName.changePhoneNumberTwo);
                    },
                    child: TextBody(
                      'Change Phone Number',
                    fontSize: 12,
                    color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
              const Gap(50),
              BusyButton(
                title: 'Get OTP',
                onTap: () {
                  Navigator.pushNamed(context, RouteName.personalOtpVerificationTwo);
                },// Placeholder function for disabled state
                disabled: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
