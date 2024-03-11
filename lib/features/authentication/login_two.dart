import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class LoginTwo extends StatefulWidget {
  const LoginTwo({Key? key}) : super(key: key);

  @override
  State<LoginTwo> createState() => _LoginTwoState();
}

class _LoginTwoState extends State<LoginTwo> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    const SizedBox(width: 10.0,),
                    //Text at the center Top
                    TextSemiBold(
                      "Login",
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                TextBold(
                  "Login Your Account",
                  fontSize: 35,
                ),
                const SizedBox(height: 40),

                InputField(
                  prefix: SvgPicture.asset(
                    'assets/icons/sms.svg',
                    width: 24.0, // Adjust size as needed
                    height: 24.0,
                    color: Colors.grey.shade600,
                  ),
                  controller: emailController,
                  placeholder: 'Email',
                  borderColorOnTap: AppColors.primaryColor,
                  onChanged: (value) {
                    // No error condition to check here
                  },
                ),

                const SizedBox(height: 20),

                // set new password inputField
                InputField(
                  prefix: SvgPicture.asset(
                    'assets/icons/lock.svg',
                    width: 24.0, // Adjust size as needed
                    height: 24.0,
                    color: Colors.grey.shade600,
                  ),
                  suffix: IconButton(
                    onPressed: () {
                      // Add onPressed functionality here
                    },
                    icon:SvgPicture.asset(AppAssets.fingerPrint)
                  ),
                  password: true,
                  controller: null,
                  placeholder: 'Password',
                  onChanged: (value) {},
                  onTap: () {},
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: BusyButton(
                    title: "Login",
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.homeScreenTwo);
                    },
                    disabled: false,
                  ),
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RouteName.forgetPasswordTwo);
                      },
                      child: TextBody('Forgot Password?'),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RouteName.signUpTwo);
                      },
                      child: TextBody(
                          'Sign Up',
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
