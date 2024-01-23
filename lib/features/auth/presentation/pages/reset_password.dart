import 'package:flutter/material.dart';
import 'package:shipoka/app/styles/app_color.dart';
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
                        vertical: 10.0, horizontal: 23.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: Text(
                      '<',
                      style: TextStyle(
                        fontSize: 27.0,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20.0,),
                //Text at the center Top
                const Center(
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 20.0,),

            //Text below Forgot Password
            Text(
              'Email Number Verification',
                style: TextStyle(
                  fontSize: 17.0,

                )
            ),

            const SizedBox(height: 50.0,),

            // Text above "Email address" TextFormField
            Text(
              'lease enter the 6-digit verification code that was sent to jerr**ka@gmail.com. The code is valid for 30 minutes',
              style: TextStyle(
                fontSize: 16.0,
                // color: Colors.grey,
              ),
            ),

            SizedBox(height: 20.0,),


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

            // Row with two different texts
            const Row(
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

            // SizedBox for spacing
            SizedBox(height: 20.0),


            // Countdown Timer
            //CountdownTimer(),

        //Send OTP button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              //Implement the logic for sending OTP
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
