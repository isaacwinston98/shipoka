import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/navigator/route_name.dart';


class PersonalCreateNewPinTwo extends StatefulWidget {
  const PersonalCreateNewPinTwo({super.key});

  @override
  State<PersonalCreateNewPinTwo> createState() => _PersonalCreateNewPinTwoState();
}

class _PersonalCreateNewPinTwoState extends State<PersonalCreateNewPinTwo> {
  bool isLoading = false;
  TextEditingController newPinController = TextEditingController();
  TextEditingController confirmPinController = TextEditingController();

  bool showConfirmPin = false;


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
                      const SizedBox(width: 15.0,),
                      //Text at the center Top
                      const Center(
                        child: Text(
                          'Create New PIN',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),


                  const Gap(40),

                  TextBody(
                      "Add a PIN number to make your Shipoka account more secure"),

                  const Gap(40),

                  TextBody(
                    "Set PIN",
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
                    visible: showConfirmPin,
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
                          ),
                        ),
                      ],
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
                        Navigator.pushNamed(context, RouteName.setupProfileTwo);
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
