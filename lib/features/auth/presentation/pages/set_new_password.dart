import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({Key? key}) : super(key: key);

  @override
  _SetNewPasswordScreenState createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  bool isLoading = false;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50.0,),

            // Back Arrow
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
                const SizedBox(width: 15.0,),
                // Text at the center Top
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

            const SizedBox(height: 65.0,),

            // Text above "Email address" TextFormField
            Text(
              'Create Your New Password',
              style: TextStyle(
                fontSize: 16.0,
                // color: Colors.grey,
              ),
            ),

            // Add a SizedBox for spacing
            const SizedBox(height: 10.0),

            // set new password inputField
            InputField(
              password: true,
              controller: null,
              placeholder: 'New Password',
              onChanged: (value) {
                setState(() {
                  showConfirmPassword = value.isNotEmpty;
                });
              },
              prefix: Icon(
                Icons.email,
                color: Colors.grey.shade600,
              ),
            ),

            const Gap(10),

            // Confirm password inputField
            Visibility(
              visible: showConfirmPassword,
              child: InputField(
                password: true,
                controller: confirmPasswordController,
                placeholder: 'Confirm Password',
                prefix: Icon(
                  Icons.email,
                  color: Colors.grey.shade600,
                ),
              ),
            ),

            // Add a SizedBox for spacing
            const SizedBox(height: 90.0),

            // Send OTP button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Implement the logic for setting new password
                  _handleContinueButton();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  minimumSize: Size(200.0, 50.0),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (!isLoading)
                      const Text(
                        'Continue',
                        style: TextStyle(color: AppColors.white),
                      ),
                    if (isLoading)
                      const CircularProgressIndicator(
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


