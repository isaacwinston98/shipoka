import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool showConfirmPassword = false;
  bool showThirdInput = false;
  late TextEditingController _controller;
  bool isWrongPassword = false;
  bool isSecondInputTapped = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
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
                    isWrongPassword = value.isNotEmpty && value != 'abcdef';
                  });
                },
                onTap: () {
                  setState(() {
                    isWrongPassword = false; // Reset error message when input field is tapped
                    isSecondInputTapped = true; // Set to true when second input field is tapped
                  });
                },
              ),
              const Gap(20),
              if (showConfirmPassword)
                Column(
                  children: [
                    InputField(
                      password: true,
                      controller: null,
                      placeholder: 'Enter New Password',
                      onChanged: (value) {
                        setState(() {
                          showThirdInput = value == _controller.text; // Compare with first input
                        });
                      },
                    ),
                    if (showThirdInput)
                      InputField(
                        password: true,
                        controller: null,
                        placeholder: 'Confirm New Password',
                        onChanged: (value) {
                          // Handle onChanged for third input field
                        },
                      ),
                  ],
                ),
              if (isWrongPassword)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Wrong password',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
