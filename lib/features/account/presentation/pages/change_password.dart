import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool showConfirmPassword = false;
  bool showThirdInput = false;
  late TextEditingController _controller;
  late TextEditingController _secondController;
  late TextEditingController _thirdController;
  bool isWrongPassword = false;
  bool isSecondInputTapped = false;
  bool isCorrectPassword = false;
  bool isPasswordsMatch = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _secondController = TextEditingController();
    _thirdController = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  const AppBackButton(),
                  const Gap(40),
                  TextSemiBold(
                    'Change Password',
                    fontSize: 20,
                  ),
                ],
              ),
              const Gap(30),
              // set new password inputField
              InputField(
                password: true,
                controller: _controller,
                placeholder: 'Enter Current Password',
                onChanged: (value) {
                  setState(() {
                    showConfirmPassword = value.isNotEmpty && value == 'abcdef';
                    isCorrectPassword = value == 'abcdef'; // Check if the password is correct
                    isWrongPassword = value.isNotEmpty && !isCorrectPassword;
                  });
                },
                onTap: () {
                  setState(() {
                    isWrongPassword = false;
                    isSecondInputTapped = true;
                  });
                },
              ),
              if (isWrongPassword) // Display "Wrong Password" error message
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Wrong Password',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              const Gap(20),
              if (showConfirmPassword)
                Column(
                  children: [
                    InputField(
                      password: true,
                      controller: _secondController,
                      placeholder: 'Enter New Password',
                      onChanged: (value) {
                        setState(() {
                          showThirdInput = value.isNotEmpty;
                          isPasswordsMatch = value == _thirdController.text;
                          if (!showThirdInput || !isPasswordsMatch) {
                            isWrongPassword = false;
                          }
                        });
                      },
                    ),
                    const Gap(20),
                    if (showThirdInput)
                      Column(
                        children: [
                          InputField(
                            password: true,
                            controller: _thirdController,
                            placeholder: 'Confirm New Password',
                            onChanged: (value) {
                              setState(() {
                                isPasswordsMatch = value == _secondController.text;
                                if (!isPasswordsMatch) {
                                  isWrongPassword = true;
                                } else {
                                  isWrongPassword = false;
                                }
                              });
                            },
                          ),
                          const Gap(5),
                          if (isWrongPassword)
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                'Passwords do not match',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          const Gap(30),
                          if (isPasswordsMatch)
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: BusyButton(
                                title: 'Update Password',
                                onTap: () {
                                  //Navigator.pushNamed(context, RouteName.addNewAddress);
                                  _handleContinueButton();
                                },
                              ),
                            ),
                        ],
                      ),
                  ],
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
        // Timer(Duration(seconds: 3), () {
        //   Navigator.of(context).pop(); // Dismiss the dialog after 3 seconds
        // });

        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30.0,),
              Padding(
                padding: EdgeInsets.only(right: 8.0, top: 10.0),
                child: Container(
                  padding: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/lockCircle.svg', // Provide your asset path here
                    width: 50, // Adjust width as needed
                    height: 50, // Adjust height as needed
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              Text(
                'Password Changed',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15.0),
              Center(
                child: Text(
                  'Your password has succesfully been changed',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 100.0),
              BusyButton(
                title: 'Ok, logout',
                onTap: () {
                  Navigator.pushNamed(context, RouteName.security);
                },
              )
            ],
          ),
          backgroundColor: Colors.white,
        );
      },
    );
  }
}
