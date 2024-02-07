import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shipoka/core/navigator/route_name.dart';



class UserProfileAccount extends StatefulWidget {
  const UserProfileAccount({super.key});

  @override
  State<UserProfileAccount> createState() => _UserProfileAccountState();
}

class _UserProfileAccountState extends State<UserProfileAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30.0,),

        // Back Arrow
        Column(
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
          ],
        ),
        const SizedBox(height: 20.0,),
        // Logo
        Image.asset(
            'assets/images/logo.png', // Replace 'assets/logo.png' with the path to your logo image asset
            width: 40, // Adjust width as needed
            height: 40, // Adjust height as needed
        ),
            const SizedBox(height: 10.0,),
            TextBold(
                "My Profile",
              style: TextStyle(
                fontSize: 22, // Adjust the font size as needed
              ),
            ),

        // Spacer
        const SizedBox(height: 18.0),

        // Text and Icon Row
            Row(
              children: [
                // Text on the left
                TextBody("Display Picture"),
                // Spacer
                Spacer(),
                // Expanded column containing Container and GestureDetector
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Container with icon
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0,top: 16.0),
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/userDisplayPicture.svg', // Provide your asset path here
                            width: 24, // Adjust width as needed
                            height: 24, // Adjust height as needed
                          ),
                        ),
                      ),
                      // Text below the container
                      GestureDetector(
                        onTap: () {
                          // Handle tap event here
                        },
                        child: Text(
                          'Tap to Change',
                          style: TextStyle(
                            fontSize: 12, // Adjust font size as needed
                            color: AppColors.primaryColor, // Adjust color as needed
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Gap(30),

            Column(
              children: [
                Row(
                  children: [
                    TextBody("Name"),
                    // Spacer
                    Spacer(),
                    TextBody("Jessica Jones"),
                  ],
                ),

                Gap(30),
                Row(
                  children: [
                    TextBody("Email"),
                    // Spacer
                    Spacer(),
                    TextBody("jess@email.com"),
                  ],
                ),

                Gap(30),
                Row(
                  children: [
                    TextBody("Phone Number"),
                    // Spacer
                    Spacer(),
                    TextBody("091234567890"),
                  ],
                ),
              ],
            ),

            Gap(40),

            //Send OTP button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //Implement the logic for sending OTP
                  Navigator.pushNamed(context, RouteName.editProfileScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  minimumSize: Size(200.0, 50.0),
                ),

                child: Stack(
                  alignment: Alignment.center,
                  children: [
                      Text(
                        'Edit profile',
                        style: TextStyle(color: AppColors.white),
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
