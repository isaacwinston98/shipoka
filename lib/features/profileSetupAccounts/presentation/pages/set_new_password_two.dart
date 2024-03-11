import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class SetNewPasswordTwo extends StatefulWidget {
  const SetNewPasswordTwo({Key? key});

  @override
  State<SetNewPasswordTwo> createState() => _SetNewPasswordTwoState();
}

class _SetNewPasswordTwoState extends State<SetNewPasswordTwo> {
  bool isLoading = false;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isButtonEnabled = false; // Track if the Continue button should be enabled

  @override
  void initState() {
    super.initState();
    // Add listener to the confirm password field to check for password match
    confirmPasswordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    // Clean up the controller and remove the listener
    confirmPasswordController.removeListener(_updateButtonState);
    super.dispose();
  }

  // Update the button state when the confirm password field changes
  void _updateButtonState() {
    setState(() {
      // Enable the Continue button only if the passwords match
      isButtonEnabled =
          newPasswordController.text == confirmPasswordController.text &&
              newPasswordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
              const SizedBox(height: 55.0,),
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
                controller: newPasswordController,
                placeholder: 'New Password',
                prefix: Icon(
                  Icons.lock,
                  color: Colors.grey.shade600,
                ),
              ),
              const Gap(10),
              // Confirm password inputField
              InputField(
                password: true,
                controller: confirmPasswordController,
                placeholder: 'Confirm Password',
                prefix: Icon(
                  Icons.lock,
                  color: Colors.grey.shade600,
                ),
              ),
              // Add a SizedBox for spacing
              const SizedBox(height: 30.0),
              // Send OTP button
              SizedBox(
                width: double.infinity,
                child: BusyButton(
                  title: 'Continue',
                  onTap: () {
                    _handleContinueButton();
                  },
                  disabled: !isButtonEnabled, // Disable the button if not enabled
                ),
              ),
            ],
          ),
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
        Timer(Duration(seconds: 6), () {
          Navigator.pushNamed(context, RouteName.loginTwo);
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


