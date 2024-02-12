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

class CardOtpVerification extends StatefulWidget {
  const CardOtpVerification({super.key});

  @override
  State<CardOtpVerification> createState() => _CardOtpVerificationState();
}

class _CardOtpVerificationState extends State<CardOtpVerification> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed to avoid memory leaks
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //const Gap(10),
                  const AppBackButton(),
                  TextSemiBold(
                    'OTP Verification',
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 50,
                    width: 50,
                    child: Text(''),
                  )
                ],
              ),
               const Gap(35),
               TextSmall(
                "Kindly enter the 6-digit verification code that was sent to 091*****8778.",
              ),
              const Gap(
                30,
              ),
              InputField(
                  controller: _controller,
                  placeholder: 'Enter  OTP'),
              const Gap(
                70,
              ),
             BusyButton(
                 title: 'Verfiy Card',
                 onTap: (){
                   showDialog(
                   context: context,
                   builder: (context) {

                     return const SuccessDialog();
                   });
                 }
             ),
              const Gap(
                30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "This form is encrypted",
                    style: TextStyle(fontSize: 12, color: Color(0xff667085)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Icon(
                      Icons.check_circle,
                      color: Color(0xffF26520),
                      size: 16,
                    ),
                  )
                ],
              )
            ],
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
            SvgPicture.asset(AppAssets.carded),
            const Gap(
               10,
            ),
            const Text(
              "Card Added",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xff101828),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextBody(
                "You have successfully added a new bank card",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff344054),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            BusyButton(
                title: 'Ok',
                onTap: (){
                  Navigator.pushNamed(context, RouteName.payment);
                })
          ],
        ),
      ),
    );
  }
}