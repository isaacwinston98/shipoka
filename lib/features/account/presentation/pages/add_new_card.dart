import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final TextEditingController _cardController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed to avoid memory leaks
    _cardController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: AppBackButton(),
          ),
          centerTitle: true,
          title: const Text(
            "Add New Card",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xff101828)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBody(
                "Securely add a bank card",

              ),
              const Gap(
                30,
              ),
              InputField(
                  controller: _cardController,
                  suffix: SvgPicture.asset(AppAssets.master),
                  placeholder: 'Enter Card number'

              ),
              const Gap(
                15,
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                        controller: _expiryController,
                        placeholder: 'Expiry date 09/25'
                    ),
                  ),
                  Gap(
                    15,
                  ),
                  Expanded(
                    child: InputField(
                        controller: _cvvController,
                        placeholder: 'CVV e.g 123'
                    ),
                  ),
                ],
              ),
              const Gap(
               70,
              ),
              BusyButton(
                  title: 'VerifyCard',
                  onTap: (){
                    Navigator.pushNamed(context, RouteName.cardOtpVerification);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
