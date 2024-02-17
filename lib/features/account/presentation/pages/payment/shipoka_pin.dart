import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';

import '../../../../../app/styles/app_color.dart';


class ShipokaPin extends StatelessWidget {
  const ShipokaPin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: const Padding(
      //     padding: EdgeInsets.only(left: 15.0),
      //     child: AppBackButton(),
      //   ),
      //   centerTitle: true,
      //   title: const Text(
      //     "Enter your pin",
      //     style: TextStyle(
      //         fontSize: 22,
      //         fontWeight: FontWeight.w500,
      //         color: Color(0xff101828)),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
           // height: MediaQuery.sizeOf(context).height*0.9,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //const Gap(10),
                      const AppBackButton(),
                      TextSemiBold(
                        'Enter Your Pin',
                        fontSize: 20,
                      ),
                      const SizedBox(
                        height: 50,
                        width: 50,
                        child: Text(''),
                      )
                    ],
                  ),
                  const SizedBox(height: 30,),
                   TextBody("Enter your Shipoka PIN to confirm topup",
                     fontSize: 15,
                     fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 50,),
                  SizedBox(
                    height: 55,
                    child: OtpTextField(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      numberOfFields: 4,
                      filled: true,
                      fillColor: AppColors.textFieldBackground,
                      fieldWidth: 70,
                      focusedBorderColor:AppColors.primaryColor,
                      showFieldAsBox: true,
                      cursorColor:AppColors.primaryColor,
                      textStyle: const TextStyle(
                        color: AppColors.textSecondaryColor,
                        fontSize: 20,
                      ),
                      onCodeChanged: (String code) {
                      },
                    ),
                  ),
                  const SizedBox(height: 100,),
                  /// Replace with button widget
                  GestureDetector(
                    onTap: () async{
                      await showDialog(
                          context: context,
                          builder: (context) {
                            SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                              statusBarColor: Colors.transparent, // Choose your desired color

                            ));
                            return const SuccessDialog();
                          });
                    },
                    child: Material(
                      elevation: 0,
                      color: const Color(0xffF26520),
                      borderRadius: BorderRadius.circular(40),
                      child: SizedBox(
                        height: 57,
                        width: MediaQuery.sizeOf(context).width,
                        child: const Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
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

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppAssets.topUp),
            const SizedBox(
              height: 10,
            ),
            TextSemiBold(
              "Top Up Successful",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xff101828),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
             const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "You have successfully funded your Shipoka Wallet with ₦5000",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff344054),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            GestureDetector(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Material(
                elevation: 0,
                color: const Color(0xffF26520),
                borderRadius: BorderRadius.circular(40),
                child: SizedBox(
                  height: 57,
                  width: MediaQuery.sizeOf(context).width,
                  child: const Center(
                    child: Text(
                      "Ok",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UnSuccessfulDialog extends StatelessWidget {
  const UnSuccessfulDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppAssets.not),
             const Gap(
              20,
            ),
            TextSemiBold(
              "Top Up Unsuccessful",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xff101828),
              ),
            ),
            const Gap(
              75,
            ),
            GestureDetector(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Material(
                elevation: 0,
                color: const Color(0xffF26520),
                borderRadius: BorderRadius.circular(40),
                child: SizedBox(
                  height: 48,
                  width: MediaQuery.sizeOf(context).width,
                  child: const Center(
                    child: Text(
                      "Try Again",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(10),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, RouteName.manageCard);
              },
              child: Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.buttonPink
                ),
                child: Center(
                  child: TextBody(
                    'Add New Card',
                    color: AppColors.primaryColor,
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}