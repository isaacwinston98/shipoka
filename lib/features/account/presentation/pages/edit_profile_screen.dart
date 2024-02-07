import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController firstNameController = TextEditingController(text: "Jessica");
  final TextEditingController lastNameController = TextEditingController(text: "Joseph");
  final TextEditingController emailController = TextEditingController(text: "Jess@email.com");
  final TextEditingController phoneNumberController = TextEditingController(text: "09123456778");


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
                        vertical: 10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: AppBackButton(),
                  ),
                ),
                const SizedBox(width: 50.0,),
                //Text at the center Top

                   TextSemiBold(
                    "Edit My Profile",
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),

            Gap(40),

            // The Email address text Field
            InputField(
              controller: firstNameController,
              placeholder: 'First Name',
            ),

            Gap(20),

            // The Email address text Field
            InputField(
              controller: lastNameController,
              placeholder: 'Last Name',
            ),

            const Gap(20),

            // The Email address text Field
            InputField(
              controller: emailController,
              placeholder: 'Email',
            ),

            Gap(20),

            // The Email address text Field
            InputField(
              controller: phoneNumberController,
              placeholder: 'Phone Number',
            ),
            
            Gap(40),

            //Spacer to push the buttons to the button
            Spacer(),

            //Row for buttons
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //Implement the logic for sending OTP
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightPink2,
                      minimumSize: Size(170.0, 50.0),
                    ),

                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          'Cancel',
                          style: TextStyle(color: AppColors.white),
                        ),

                      ],
                    ),
                  ),
                  //Button on the right
                  ElevatedButton(
                    onPressed: () {
                      //Implement the logic for sending OTP
                      Navigator.pushNamed(context, RouteName.updateYourPhonrNumber);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      minimumSize: Size(170.0, 50.0),
                    ),

                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          'Save Change',
                          style: TextStyle(color: AppColors.white),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}