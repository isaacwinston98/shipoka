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
import 'package:shipoka/core/navigator/route_name.dart';
import 'package:shipoka/core/utils/custom_form_validator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var canSubmit = false;

  late StreamController<String> _emailStreamController;
  late StreamController<String> _pinStreamController;
  late StreamController<String> _firstNameStreamController;
  late StreamController<String> _surnameStreamController;
  late StreamController<String> _repeatPinStreamController;
  late StreamController<String> _refferalPinStreamController;
  late StreamController<String> _phoneStreamController;

  final emailFocus = FocusNode();
  final pinFocus = FocusNode();
  final firstNameFocus = FocusNode();
  final surnameFocus = FocusNode();
  final phoneFocus = FocusNode();
  final repeatPinFocus = FocusNode();
  final refferalPinFocus = FocusNode();

  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
  final pinController = TextEditingController();
  final repeatPinController = TextEditingController();
  final refferalController = TextEditingController();

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _emailStreamController = StreamController<String>.broadcast();
    _pinStreamController = StreamController<String>.broadcast();
    _firstNameStreamController = StreamController<String>.broadcast();
    _surnameStreamController = StreamController<String>.broadcast();
    _phoneStreamController = StreamController<String>.broadcast();
    _repeatPinStreamController = StreamController<String>.broadcast();
    _refferalPinStreamController = StreamController<String>.broadcast();

    emailController.addListener(() {
      _emailStreamController.sink.add(
        emailController.text.trim(),
      );
      validateInputs();
    });

    pinController.addListener(() {
      _pinStreamController.sink.add(
        pinController.text.trim(),
      );
      validateInputs();
    });

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

    repeatPinController.addListener(() {
      _repeatPinStreamController.sink.add(
        repeatPinController.text.trim(),
      );
      validateInputs();
    });

    refferalController.addListener(() {
      _refferalPinStreamController.sink.add(
        repeatPinController.text.trim(),
      );
      validateInputs();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailStreamController.close();
    _pinStreamController.close();
    _surnameStreamController.close();
    _firstNameStreamController.close();
    _repeatPinStreamController.close();
    _refferalPinStreamController.close();
    _phoneStreamController.close();

    emailFocus.dispose();
    phoneFocus.dispose();
    pinFocus.dispose();
    repeatPinFocus.dispose();
  }

  void validateInputs() {

    final emailError = CustomFormValidation.errorEmailMessage(
      emailController.text.trim(),
      'Email is required',
    );

    final pinError = CustomFormValidation.errorMessagePin(
      pinController.text.trim(),
      'Pin is required',
    );

    final confirmPinError = CustomFormValidation.errorMessageConfirmPin(
      repeatPinController.text.trim(),
      're-enter pin',
      pinController.text.trim(),
    );

    if (emailError != '' ||
        pinError != '' ||
        confirmPinError != '') {
      canSubmit = false;
    }

    setState(() {
      canSubmit =false ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20,top: 20),
                        child: Row(
                          children: [
                            const AppBackButton(),
                            const Gap(20),
                            TextSemiBold(
                              'Login',
                              fontSize: 16,
                            ),


                          ],
                        ),
                      ),
                      const Gap(15),
                      TextBold(
                        'Login your ',
                        fontSize: 33,

                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child:TextBold(
                          'Account',
                          fontSize: 33,

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: StreamBuilder<String>(
                          stream: _emailStreamController.stream,
                          builder: (context, snapshot) {
                            return InputField(
                              fieldFocusNode: emailFocus,
                              prefix:  Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: SvgPicture.asset(
                                  AppAssets.email,
                                  color: AppColors.smallTextColor,
                                ),
                              ),
                              label: 'Email',
                              validationColor: snapshot.data == null
                                  ? AppColors.white
                                  : CustomFormValidation.getColor(
                                snapshot.data,
                                emailFocus,
                                CustomFormValidation.errorEmailMessage(
                                  snapshot.data,
                                  'Email is required',
                                ),
                              ),
                              controller: emailController,
                              placeholder: 'Email',
                              validationMessage:
                              CustomFormValidation.errorEmailMessage(
                                snapshot.data,
                                'Email is required',
                              ),
                            );
                          },
                        ),
                      ),
                      const Gap(5),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: StreamBuilder<String>(
                          stream: _pinStreamController.stream,
                          builder: (context, snapshot) {
                            return InputField(
                              label: 'Password',
                              fieldFocusNode: pinFocus,
                              textInputType: TextInputType.text,
                              suffix:  SvgPicture.asset(
                                AppAssets.fingerPrint,
                              ),
                              prefix: Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: SvgPicture.asset(
                                  AppAssets.password,
                                ),
                              ),
                              validationColor: snapshot.data == null
                                  ? AppColors.white
                                  : CustomFormValidation.getColor(
                                snapshot.data,
                                pinFocus,
                                CustomFormValidation.errorMessagePassword2(
                                  snapshot.data,
                                  'Password is required',
                                ),
                              ),
                              validationMessage: CustomFormValidation.errorMessagePassword2(
                                snapshot.data,
                                'Password is required',
                              ),
                              controller: pinController,
                              placeholder: 'Password',
                            );
                          },
                        ),
                      ),
                      const Gap(5),
                      const Gap(5),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: BusyButton(
                          title: 'Login',
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.setupProfile);
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextSmall(
                                    'Forgot Password? ',
                                  ),
                                  TextSmall(
                                    'Reset',
                                    color: AppColors.primaryColor,
                                  ),
                                ],
                              )
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, RouteName.signUp);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: TextSmall(
                                'Sign Up',
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
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
