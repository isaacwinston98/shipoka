import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/navigator/route_name.dart';
import 'package:shipoka/core/utils/custom_form_validator.dart';

class ChangePhoneNumber extends StatefulWidget {
  const ChangePhoneNumber({super.key});

  @override
  State<ChangePhoneNumber> createState() => _ChangePhoneNumberState();

}

class _ChangePhoneNumberState extends State<ChangePhoneNumber> {

  List<String> countryCodes = ['+1', '+44', '+91', '+81']; // Add your country codes

  String selectedCountryCode = '+1'; // Default country code
  late StreamController<String> _phoneStreamController;
  final phoneController = TextEditingController();
  final phoneFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _phoneStreamController = StreamController<String>.broadcast();


    phoneController.addListener(() {
      _phoneStreamController.sink.add(
        phoneController.text.trim(),
      );
      validateInputs();
    });

  }

  @override
  void dispose() {
    super.dispose();

    _phoneStreamController.close();
    phoneFocus.dispose();
  }

  void validateInputs() {
    // var canSumit = true;

    final phoneError = CustomFormValidation.errorPhoneNumber2(
      phoneController.text,
      'Phone number is required',
    );

    if (phoneError != '') {
      // canSumit = false;
    }
    //_canSubmit.value = canSumit;
  }


  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(10),
                TextSemiBold(
                    'Change Phone Number',
                  fontSize: 22,
                ),
                const Gap(48),
                TextBody(
                  'Enter New Number',
                  color: AppColors.smallTextColor,
                  fontSize: 16,
                ),
                const Gap(5),
                Row(
                  children: [
                    // Country Code Dropdown
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.textFieldBackground,
                        border: Border.all(color: AppColors.textFieldBackground),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton<String>(
                          underline: Container(),
                          value: selectedCountryCode,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCountryCode = newValue!;
                            });
                          },
                          items: countryCodes.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: StreamBuilder<String>(
                        stream: _phoneStreamController.stream,
                        builder: (context, snapshot) {
                          return InputField(
                            //
                           // fieldFocusNode: phoneFocus,
                            label: 'Phone number',
                            validationColor: snapshot.data == null
                                ? AppColors.white
                                : CustomFormValidation.getColor(
                              snapshot.data,
                              phoneFocus,
                              CustomFormValidation.errorPhoneNumber2(
                                snapshot.data,
                                'phone number is required',
                              ),
                            ),
                            controller: phoneController,
                            placeholder: 'Phone number',
                            validationMessage:
                            CustomFormValidation.errorPhoneNumber2(
                              snapshot.data,
                              'phone number is required',
                            ),
                            textInputType: TextInputType.number,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: BusyButton(
                    title: 'Change',
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.signUp);
                      // Provider.of<AuthNotifier>(context, listen: false)
                      //     .register(
                      //   context,
                      //   firstName: firstNameController.text.trim(),
                      //   lastName: surnameController.text.trim(),
                      //   email: emailController.text.trim(),
                      //   countryCode: 'NG',
                      //   pin: pinController.text.trim(),
                      //   phoneNumber: phoneController.text.trim(),
                      // );
                    },
                    // disabled: !canSubmit,
                  ),
                ),
              ],
            ),
          ) ,
      ),
    );
  }
}
