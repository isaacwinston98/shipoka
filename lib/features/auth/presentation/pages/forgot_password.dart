import 'package:flutter/material.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/input_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal:23.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: Text(
                        '<',
                      style: TextStyle(
                        fontSize: 30.0,
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
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 20.0,),

            //Text below Forgot Password
            TextBody(
              'To reset your password, please enter your '
                  'registered email address.',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.grey4,

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
             controller: null,
             placeholder: 'email',),

            const SizedBox(height: 45.0,),

            //Send OTP button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){
                    //Implement the logic for sending OTP
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  minimumSize: Size(200.0, 50.0),
                ),
                  child: Text('Send OTP', style: TextStyle(color: AppColors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}