import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextBody(
              "Sign Up",
              fontSize: 18,
            ),
            const Gap(30),
            TextBold(
              "Create Your Account",
              fontSize: 35,
            ),
            const Gap(40),
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
              borderColorOnTap: AppColors.primaryColor,
              onChanged: (value) {
                // Handle onChanged callback
              },
            ),
            const Gap(20),
            // set new password inputField
            InputField(
              prefix: SvgPicture.asset(
                'assets/icons/lock.svg',
                width: 24.0, // Adjust size as needed
                height: 24.0,
                color: Colors.grey.shade600,
              ),
              password: true,
              controller: null,
              placeholder: 'Password (Must Be Atleast 8 Characters) ',
              onChanged: (value) {},
              onTap: () {},
            ),
            const Gap(20),
            InputField(
              prefix: SvgPicture.asset(
                'assets/icons/lock.svg',
                width: 24.0, // Adjust size as needed
                height: 24.0,
                color: Colors.grey.shade600,
              ),
              password: true,
              controller: null,
              placeholder: 'Confirm Password',
              onChanged: (value) {},
              onTap: () {},
            ),
            const Gap(10),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                  visualDensity: VisualDensity.standard, // Adjust the size of the checkbox
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Remove tap effect
                  side: BorderSide(
                    color: _isChecked ? AppColors.primaryColor : AppColors.primaryColor, // Border color when checked
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0), // Adjust the border radius
                  ),
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return AppColors.primaryColor; // Fill color when checked
                      }
                      return Colors.transparent; // Fill color when unchecked
                    },
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBody(
                      'By Creating An Account, I agree to Shipoka’s Term and',
                      style: TextStyle(fontSize: 10),
                    ),
                    TextBody(
                      "Conditions.",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: BusyButton(
                title: "Sign up",
                onTap: () {
                  Navigator.pushNamed(context, RouteName.setupProfile);
                },
                disabled: true,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextSmall(
                    'Already have an account? ',
                    color: AppColors.smallTextColor,
                  ),
                  TextSmall(
                    'Sign In',
                    color: AppColors.primaryColor,

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
