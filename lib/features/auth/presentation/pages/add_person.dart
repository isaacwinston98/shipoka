import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/navigator/route_name.dart';
import 'package:shipoka/core/utils/custom_form_validator.dart';

class AddPersonContact extends StatefulWidget {
  const AddPersonContact({super.key});

  @override
  State<AddPersonContact> createState() => _AddPersonContactState();
}

class _AddPersonContactState extends State<AddPersonContact> {
  late StreamController<String> _contactLastNameStreamController;
  late StreamController<String> _contactFirstNameStreamController;
  late StreamController<String> _contactEmailStreamController;
  late StreamController<String> _phoneStreamController;


  final contactLastNameFocus = FocusNode();
  final contactFirstNameFocus = FocusNode();
  final contactEmailFocus = FocusNode();
  final phoneFocus = FocusNode();


  final contactLastNameController = TextEditingController();
  final contactFirstNameController = TextEditingController();
  final contactEmailController = TextEditingController();
  final phoneController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _contactLastNameStreamController = StreamController<String>.broadcast();
    _contactFirstNameStreamController = StreamController<String>.broadcast();
    _contactEmailStreamController = StreamController<String>.broadcast();
    _phoneStreamController = StreamController<String>.broadcast();




    contactLastNameController.addListener(() {
      _contactLastNameStreamController.sink.add(
        contactLastNameController.text.trim(),
      );
      validateInputs();
    });

    contactFirstNameController.addListener(() {
      _contactFirstNameStreamController.sink.add(
        contactFirstNameController.text.trim(),
      );
      validateInputs();
    });

    contactEmailController.addListener(() {
      _contactEmailStreamController.sink.add(
        contactEmailController.text.trim(),
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

    _contactFirstNameStreamController.close();
    _contactLastNameStreamController.close();
    _phoneStreamController.close();

    contactLastNameFocus.dispose();
    contactFirstNameFocus.dispose();
    phoneFocus.dispose();
  }

  void validateInputs() {
    // var canSumit = true;

    final firstNameError = CustomFormValidation.errorMessage(
      contactLastNameController.text.trim(),
      'First name is required',
    );

    final surnameError = CustomFormValidation.errorMessage(
      contactFirstNameController.text.trim(),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              'Add Person Contact',
                              fontSize: 20,
                              color: AppColors.smallTextColor,
                            ),


                          ],
                        ),
                        const Gap(25),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextSmall(
                            'You\'re Just One Step Away from Completion: Share Your Business Contact Info',
                            fontSize: 14,
                            color: AppColors.smallTextColor,
                            fontWeight: FontWeight.w400,

                          ),
                        ),
                        const Gap(40),
                        StreamBuilder<String>(
                          stream: _contactFirstNameStreamController.stream,
                          builder: (context, snapshot) {
                            return InputField(
                              fieldFocusNode: contactFirstNameFocus,
                              label: 'Contact First name',
                              validationColor: snapshot.data == null
                                  ? AppColors.white
                                  : CustomFormValidation.getColor(
                                snapshot.data,
                                contactFirstNameFocus,
                                CustomFormValidation.errorMessage(
                                  snapshot.data,
                                  'Contact First name is required',
                                ),
                              ),
                              controller: contactFirstNameController,
                              placeholder: 'Contact First name',
                              validationMessage: CustomFormValidation.errorMessage(
                                snapshot.data,
                                'LastName is required',
                              ),
                            );
                          },
                        ),
                        const Gap(5),
                        StreamBuilder<String>(
                          stream: _contactLastNameStreamController.stream,
                          builder: (context, snapshot) {
                            return InputField(
                              fieldFocusNode: contactLastNameFocus,
                              label: 'Contact Last Name',
                              validationColor: snapshot.data == null
                                  ? AppColors.white
                                  : CustomFormValidation.getColor(
                                snapshot.data,
                                contactLastNameFocus,
                                CustomFormValidation.errorMessage(
                                  snapshot.data,
                                  'Contact Last Name is required',
                                ),
                              ),
                              controller: contactLastNameController,
                              placeholder: 'Contact Last Name',
                              validationMessage: CustomFormValidation.errorMessage(
                                snapshot.data,
                                'Contact Last Name is required',
                              ),
                            );
                          },
                        ),
                        const Gap(5),
                        StreamBuilder<String>(
                          stream: _contactEmailStreamController.stream,
                          builder: (context, snapshot) {
                            return InputField(
                              fieldFocusNode: contactEmailFocus,
                              label: 'Contact Email address',
                              validationColor: snapshot.data == null
                                  ? AppColors.white
                                  : CustomFormValidation.getColor(
                                snapshot.data,
                                contactEmailFocus,
                                CustomFormValidation.errorMessage(
                                  snapshot.data,
                                  'Contact Email address is required',
                                ),
                              ),
                              controller: contactEmailController,
                              placeholder: 'Contact Email address',
                              validationMessage: CustomFormValidation.errorMessage(
                                snapshot.data,
                                'Contact Email address is required',
                              ),
                            );
                          },
                        ),
                        const Gap(5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Country Code Dropdown
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.textFieldBackground,
                                border: Border.all(color: AppColors.textFieldBackground),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 11),
                                child: Row(
                                  children: [
                                    TextSmall('Code'),
                                    Gap(5),
                                    Icon(
                                      Icons.arrow_drop_down_outlined
                                    )
                                  ],
                                )
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

                      ],

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: BusyButton(
                    title: 'Continue',
                    onTap: () {
                    Navigator.pushNamed(context, RouteName.navBar);
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
