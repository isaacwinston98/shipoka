import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/navigator/route_name.dart';
import 'package:shipoka/features/auth/presentation/pages/reset_password.dart';

class ForgetPasswordTwo extends StatefulWidget {
  const ForgetPasswordTwo({Key? key});

  @override
  State<ForgetPasswordTwo> createState() => _ForgetPasswordTwoState();
}

class _ForgetPasswordTwoState extends State<ForgetPasswordTwo> {
  bool isLoading = false;
  bool isEmailEntered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40.0,),
            // Back Arrow
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
            const SizedBox(height: 20.0,),
            // Text below Forgot Password
            TextBody(
                'To reset your password, please enter your '
                    'registered email address.',
                style: TextStyle(
                  fontSize: 15.0,
                )
            ),
            const SizedBox(height: 50.0,),
            // Text above "Email address" TextFormField
            TextBody(
              'Enter Your Email Address.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            // The Email address text Field
            InputField(
              prefix: SvgPicture.asset(
                'assets/icons/sms.svg',
                width: 24.0, // Adjust size as needed
                height: 24.0,
                color: Colors.grey.shade600,
              ),
              controller: null,
              placeholder: 'Email',
              onChanged: (value) {
                setState(() {
                  isEmailEntered = value.isNotEmpty;
                });
              },
            ),
            // Send OTP button
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: BusyButton(
                title: "Send OTP",
                onTap: () {
                  Navigator.pushNamed(context, RouteName.passwordVerifyEmail);
                },
                disabled: !isEmailEntered,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
