import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/features/auth/presentation/pages/reset_password.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50.0,),

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
                'To reset your password, please enter your '
                    'registered email address.',
                style: TextStyle(
                  fontSize: 17.0,
                )
            ),

            const SizedBox(height: 50.0,),

            // Text above "Email address" TextFormField
            Text(
              'Enter your email address.',
              style: TextStyle(
                fontSize: 16.0,
                // color: Colors.grey,
              ),
            ),

            const SizedBox(height: 10.0),

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
            ),


            const SizedBox(height: 35.0,),

            //Send OTP button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //Implement the logic for sending OTP
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InputOTPScreen(),
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
                        'Send OTP',
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


// Function to handle OTP sending logic
/*void _sendOTP() async {
  // Set loading state to true
  setState(() {
    isLoading = true;
  });

  // Implement the logic for sending OTP
  await Future.delayed(Duration(seconds: 2)); // Simulating a delay

  // Set loading state to false after the operation is complete
  setState(() {
    isLoading = false;
  });
}*/
}