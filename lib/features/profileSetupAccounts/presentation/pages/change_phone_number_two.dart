import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class ChangePhoneNumberTwo extends StatefulWidget {
  const ChangePhoneNumberTwo({super.key});

  @override
  State<ChangePhoneNumberTwo> createState() => _ChangePhoneNumberTwoState();
}

class _ChangePhoneNumberTwoState extends State<ChangePhoneNumberTwo> {
  String selectedCountryCode = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextSemiBold(
                "Change Phone Number",
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap(50),
              TextBody('Enter New Number'),
              const Gap(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Country Code Dropdown
                  GestureDetector(
                    onTap: (){
                      showCountryPicker(
                          context: context,
                          showPhoneCode: true,
                          countryListTheme: CountryListThemeData(
                            flagSize: 25,
                            backgroundColor: Colors.white,
                            textStyle: const TextStyle(fontSize: 16, color: AppColors.textColor),
                            bottomSheetHeight: MediaQuery.of(context).size.height * 0.9,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                            inputDecoration: InputDecoration(
                              fillColor: AppColors.textFieldBackground,
                              hintText: 'Search Country',
                              suffix: SvgPicture.asset(
                                  AppAssets.search
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          onSelect: (Country country){
                            setState(() {
                              selectedCountryCode = country.phoneCode; // Update the selected country code
                            });
                          }
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.textFieldBackground,
                        border: Border.all(color: AppColors.textFieldBackground),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              TextSmall(
                                selectedCountryCode == ''
                                    ? '+234'
                                    : "+$selectedCountryCode",
                                fontWeight:FontWeight.w500,

                              ),
                              const Gap(5),
                              const Icon(
                                  Icons.arrow_drop_down_outlined
                              )
                            ],
                          )
                      ),
                    ),
                  ),
                  const Gap(5),
                  const Expanded(
                    child: InputField(
                      placeholder: 'Phone Number',
                      textInputType: TextInputType.number,
                      controller: null,
                    ),
                  ),
                ],
              ),
              const Gap(20),
              BusyButton(
                title: 'Change',
                onTap: () {
                  Navigator.pushNamed(context, RouteName.securityVerificationTwo);
                },// Placeholder function for disabled state
                disabled: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
