import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/utils/custom_form_validator.dart';

class PersonalProfile extends StatefulWidget {
  const PersonalProfile({super.key});

  @override
  State<PersonalProfile> createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> {

  late StreamController<String> _firstNameStreamController;
  late StreamController<String> _surnameStreamController;
  late StreamController<String> _phoneStreamController;


  final firstNameFocus = FocusNode();
  final surnameFocus = FocusNode();
  final phoneFocus = FocusNode();


  final firstNameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _firstNameStreamController = StreamController<String>.broadcast();
    _surnameStreamController = StreamController<String>.broadcast();
    _phoneStreamController = StreamController<String>.broadcast();




    firstNameController.addListener(() {
      _firstNameStreamController.sink.add(
        firstNameController.text.trim(),
      );
      validateInputs();
    });

    surnameController.addListener(() {
      _surnameStreamController.sink.add(
        surnameController.text.trim(),
      );
      validateInputs();
    });

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

    _surnameStreamController.close();
    _firstNameStreamController.close();
    _phoneStreamController.close();

    firstNameFocus.dispose();
    surnameFocus.dispose();
    phoneFocus.dispose();
  }

  void validateInputs() {
    // var canSumit = true;

    final firstNameError = CustomFormValidation.errorMessage(
      firstNameController.text.trim(),
      'First name is required',
    );

    final surnameError = CustomFormValidation.errorMessage(
      surnameController.text.trim(),
      'Surname is required',
    );

    final phoneError = CustomFormValidation.errorPhoneNumber2(
      phoneController.text,
      'Phone number is required',
    );

    if (
        firstNameError != '' ||
        surnameError != '' ||
        phoneError != ''
    ) {
      // canSumit = false;
    }
    //_canSubmit.value = canSumit;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Gap(10),
                        Row(
                          children: [
                            const AppBackButton(),
                            const Gap(20),
                            TextSemiBold(
                              'Fill Your Profile',
                              fontSize: 20,
                            ),


                          ],
                        ),
                        const Gap(25),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.editPersonColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: SvgPicture.asset(
                                  AppAssets.user,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                icon: SvgPicture.asset(
                                  AppAssets.edit,
                                ),
                                onPressed: () {
                                  // Add logic to handle selecting a picture
                                },
                              ),
                            ),
                          ],
                        ),
                        const Gap(20),
                        StreamBuilder<String>(
                          stream: _firstNameStreamController.stream,
                          builder: (context, snapshot) {
                            return InputField(
                              label: 'First name',
                              fieldFocusNode: firstNameFocus,
                              validationColor: snapshot.data == null
                                  ? AppColors.white
                                  : CustomFormValidation.getColor(
                                snapshot.data,
                                firstNameFocus,
                                CustomFormValidation.errorMessage(
                                  snapshot.data,
                                  'First name is required',
                                ),
                              ),
                              controller: firstNameController,
                              placeholder: 'First name',
                              validationMessage: CustomFormValidation.errorMessage(
                                snapshot.data,
                                'First name is required',
                              ),
                            );
                          },
                        ),
                        StreamBuilder<String>(
                          stream: _surnameStreamController.stream,
                          builder: (context, snapshot) {
                            return InputField(
                              fieldFocusNode: surnameFocus,
                              label: 'LastName',
                              validationColor: snapshot.data == null
                                  ? AppColors.white
                                  : CustomFormValidation.getColor(
                                snapshot.data,
                                surnameFocus,
                                CustomFormValidation.errorMessage(
                                  snapshot.data,
                                  'LastName is required',
                                ),
                              ),
                              controller: surnameController,
                              placeholder: 'LastName',
                              validationMessage: CustomFormValidation.errorMessage(
                                snapshot.data,
                                'LastName is required',
                              ),
                            );
                          },
                        ),
                        StreamBuilder<String>(
                          stream: _phoneStreamController.stream,
                          builder: (context, snapshot) {
                            return InputField(
                              fieldFocusNode: phoneFocus,
                              label: 'Phone number',
                              prefix: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      TextBody(
                                        '+234',
                                        fontSize: 14,
                                      )
                                    ],
                                  ),
                                ),
                              ),
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
                      ],

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: BusyButton(
                    title: 'Continue',
                    onTap: () {
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
                    disabled: true,
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
