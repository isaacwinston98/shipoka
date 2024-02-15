import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/features/auth/presentation/pages/set_new_password.dart';
//import 'package:pin_code_fields/pin_code_fields.dart';

class InputOTPScreen extends StatefulWidget {
  const InputOTPScreen({Key? key}) : super(key: key);

  @override
  State<InputOTPScreen> createState() => _InputOTPScreenState();
}

class _InputOTPScreenState extends State<InputOTPScreen> {
  //TextEditingController _otpController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.0,),

            // ... other widgets ...

            //Back Arrow
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: AppBackButton(),
                  ),
                ),
                const SizedBox(width: 15.0,),
                //Text at the center Top
                 Center(
                  child: TextSemiBold(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 40.0,),

            //Text below Forgot Password
            Text(
              'Email Number Verification',
                style: TextStyle(
                  fontSize: 17.0,

                )
            ),

            const SizedBox(height: 7.0,),

            // Text above "Email address" TextFormField
            TextSmall(
              'please enter the 6-digit verification code that was sent to jerr**ka@gmail.com. The code is valid for 30 minutes',
              style: TextStyle(
                fontSize: 13.0,
                // color: Colors.grey,
              ),
            ),

            SizedBox(height: 40.0,),


            // PinCodeTextField for OTP input
            /*PinCodeTextField(
              appContext: context,
              controller: _otpController,
              length: 6, // You can adjust the length as needed
              onChanged: (value) {
                // Handle OTP input change
              },
              onCompleted: (pin) {
                // Implement logic when OTP is completed
              },
            ),*/

            SizedBox(
              height: 60,
              child: OtpTextField(
                borderRadius: const BorderRadius.all(Radius.circular(7)),
                numberOfFields: 6,
                filled: true,
                fillColor: AppColors.textFieldBackground,
                fieldWidth: 55,
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

            const Gap(8),

            // Row with two different texts
            const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Didn’t receive code?',
                    style: TextStyle(),
                  ),
                  SizedBox(width: 5.0), // Add space between texts
                  Text(
                    'Resend',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),

            // SizedBox for spacing
            SizedBox(height: 60.0),


            // Countdown Timer
            //CountdownTimer(),

        //Send OTP button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              //Implement the logic for inputing OTP code
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SetNewPasswordScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              minimumSize: Size(200.0, 50.0),
            ),

            child: Stack(
              alignment: Alignment.center,
              children: [
                if (!isLoading)
                  Text(
                    'Submit',
                    style: TextStyle(color: AppColors.white),
                  ),
                if (isLoading)
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
              ],
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}

/*class CountdownTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement the countdown timer widget here
    return Container(
      // Your countdown timer UI goes here
    );
  }
}*/
