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


  final emailFocus = FocusNode();
  final pinFocus = FocusNode();

  final emailController = TextEditingController();
  final pinController = TextEditingController();


  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _emailStreamController = StreamController<String>.broadcast();
    _pinStreamController = StreamController<String>.broadcast();


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





  }

  @override
  void dispose() {
    super.dispose();
    _emailStreamController.close();
    _pinStreamController.close();

    emailFocus.dispose();
    pinFocus.dispose();
  }

  // void validateInputs() {
  //
  //   final emailError = CustomFormValidation.errorEmailMessage(
  //     emailController.text.trim(),
  //     'Email is required',
  //   );
  //
  //   final pinError = CustomFormValidation.errorMessagePin(
  //     pinController.text.trim(),
  //     'Pin is required',
  //   );
  //
  //   if (emailError != '' ||
  //       pinError != '' ) {
  //     canSubmit = false;
  //   }
  //
  //   setState(() {
  //     canSubmit =false ;
  //   });
  // }

  void validateInputs() {
    final emailError = CustomFormValidation.errorEmailMessage(
      emailController.text.trim(),
      'Email is required',
    );

    final pinError = CustomFormValidation.errorMessagePassword2(
      pinController.text.trim(),
      'Password is required',
    );

    // Check if email is valid and pin has at least 8 characters
    setState(() {
      canSubmit = emailError.isEmpty && pinError.isEmpty;
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
                                  color: AppColors.textSecondaryColor,
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
                              password: true,
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
                                  color: AppColors.textSecondaryColor,
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
                            Navigator.pushNamed(context, RouteName.navBar);

                          },
                          disabled: !canSubmit,
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
