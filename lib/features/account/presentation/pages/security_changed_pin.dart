import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';


class SecurityChangedPin extends StatefulWidget {
  const SecurityChangedPin({super.key});

  @override
  State<SecurityChangedPin> createState() => _SecurityChangedPinState();
}

class _SecurityChangedPinState extends State<SecurityChangedPin> {
  bool isLoading = false;
  TextEditingController newPinController = TextEditingController();
  TextEditingController confirmPinController = TextEditingController();

  bool showConfirmPin = false;
  bool pinMatchError = false; // Track if there's a pin match error

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            width: MediaQuery.of(context).size.width, // Or set a custom width
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                            vertical: 10.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: AppBackButton(),
                        ),
                      ),
                      const Gap(50),
                      //Text at the center Top
                      Center(
                        child: TextSemiBold(
                          'Change PIN',
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  ),

                  const Gap(40),

                  TextBody(
                    "Enter current PIN",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),

                  const Gap(15),

                  // ... other components ...

                  // PinCodeTextField for PIN input
                  SizedBox(
                    height: 50,
                    child: OtpTextField(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      numberOfFields: 4,
                      filled: true,
                      obscureText: true,
                      fillColor: AppColors.textFieldBackground,
                      fieldWidth: 65,
                      focusedBorderColor:AppColors.primaryColor,
                      showFieldAsBox: true,
                      cursorColor:AppColors.primaryColor,
                      textStyle: const TextStyle(
                        color: AppColors.textSecondaryColor,
                        fontSize: 30,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 7), // Add this line
                      onCodeChanged: (String code) {
                        setState(() {
                          showConfirmPin = code.isNotEmpty;
                          newPinController.text = code; // Update the controller
                        });
                      },
                    ),
                  ),

                  // For the first PIN input


                  const Gap(15),

                  // Show confirm PIN field if the first PIN is entered
                  // Confirm password inputField
                  Visibility(
                    visible: true, // Always visible
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBody(
                          "Confirm PIN",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        const Gap(3),
                        SizedBox(
                          height: 50,
                          child: OtpTextField(
                            borderRadius: BorderRadius.circular(7),
                            numberOfFields: 4,
                            filled: true,
                            obscureText: true,
                            fillColor: AppColors.textFieldBackground,
                            fieldWidth: 65,
                            focusedBorderColor: AppColors.primaryColor,
                            showFieldAsBox: true,
                            cursorColor: AppColors.primaryColor,
                            textStyle: TextStyle(
                              color: AppColors.textSecondaryColor,
                              fontSize: 30,
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 7), // Add this line
                            onCodeChanged: (String code) {
                              setState(() {
                                confirmPinController.text = code; // Update the controller
                                pinMatchError = newPinController.text != confirmPinController.text;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Display error message if pins don't match
                  if (pinMatchError)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'PIN does not match',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),

                  // SizedBox for spacing
                  SizedBox(height: 40.0),

                  // Countdown Timer
                  //... other components ...

                  // Send Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement logic for creating a new PIN
                        if (newPinController.text == confirmPinController.text) {
                          // Show success dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Stack(
                                children: [
                                  Positioned(
                                    top: 30,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width - 20, // Adjusted width
                                      margin: EdgeInsets.symmetric(horizontal: 5,), // Adjusted margin
                                      child: AlertDialog(
                                        backgroundColor: AppColors.lightModel, // Change background color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8), // Adjusted border radius
                                        ),
                                        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20), // Adjust content padding
                                        content: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/checkCircle.svg', // Provide your asset path here
                                            ),
                                            SizedBox(width: 16),
                                            TextBody(
                                              'PIN changed Successfully.',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );



                        } else {
                          // Show error message
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.red, // Change background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Adjusted border radius
                                ),
                                title: Text('Error', style: TextStyle(color: Colors.white)), // Change title text color
                                content: Text('PIN does not match.', style: TextStyle(color: Colors.white)), // Change content text color
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
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
                              'Create PIN',
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
          ),
        ),
      ),
    );
  }
}
