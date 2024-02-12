import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';
import 'package:shipoka/core/utils/custom_form_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  bool isChecked = false;
  var canSubmit = false;

  late StreamController<String> _emailStreamController;
  late StreamController<String> _passwordStreamController;
  late StreamController<String> _repeatPasswordStreamController;

  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final repeatPasswordFocus = FocusNode();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();



  @override
  void initState() {
    super.initState();
    _emailStreamController = StreamController<String>.broadcast();
    _passwordStreamController = StreamController<String>.broadcast();
    _repeatPasswordStreamController = StreamController<String>.broadcast();

    emailController.addListener(() {
      _emailStreamController.sink.add(
        emailController.text.trim(),
      );
      validateInputs();
    });

    passwordController.addListener(() {
      _passwordStreamController.sink.add(
        passwordController.text.trim(),
      );
     validateInputs();
    });

    repeatPasswordController.addListener(() {
      _repeatPasswordStreamController.sink.add(
        repeatPasswordController.text.trim(),
      );
     validateInputs();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailStreamController.close();
    _passwordStreamController.close();
    _repeatPasswordStreamController.close();

    emailFocus.dispose();
    passwordFocus.dispose();
    repeatPasswordFocus.dispose();
  }

  void validateInputs() {
    final emailError = CustomFormValidation.errorEmailMessage(
      emailController.text.trim(),
      'Email is required',
    );

    final passwordError = CustomFormValidation.errorMessagePassword2(
      passwordController.text.trim(),
      'Password is required',
    );

    final confirmPasswordError = CustomFormValidation.errorMessageConfirmPassword(
      repeatPasswordController.text.trim(),
      'Re-enter password',
      passwordController.text,
    );

    // Check if the checkbox is checked and there are no validation errors
    setState(() {
      canSubmit = isChecked &&
          emailError.isEmpty &&
          passwordError.isEmpty &&
          confirmPasswordError.isEmpty;
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
                        child:TextSemiBold(
                          AppLocalizations.of(context).signup,
                          fontSize: 16,

                        ),
                      ),
                      const Gap(15),
                      TextBold(
                        AppLocalizations.of(context).createYour,
                        fontSize: 33,

                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child:TextBold(
                          AppLocalizations.of(context).account,
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
                              placeholder:  AppLocalizations.of(context).email,
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
                          stream: _passwordStreamController.stream,
                          builder: (context, snapshot) {
                            return InputField(
                              label: 'Password',
                              fieldFocusNode: passwordFocus,
                              textInputType: TextInputType.text,
                              password: true,
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
                                passwordFocus,
                                CustomFormValidation.errorMessagePassword2(
                                  snapshot.data,
                                  'Password is required',
                                ),
                              ),
                              validationMessage: CustomFormValidation.errorMessagePassword2(
                                snapshot.data,
                                'Password is required',
                              ),
                              controller: passwordController,
                              placeholder:AppLocalizations.of(context).password,
                            );
                          },
                        ),
                      ),
                      const Gap(5),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: StreamBuilder<String>(
                          stream: _repeatPasswordStreamController.stream,
                          builder: (context, snapshot) {
                            return InputField(
                              fieldFocusNode: repeatPasswordFocus,
                              label: 'Confirm password',
                              prefix:  Padding(
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
                                repeatPasswordFocus,
                                CustomFormValidation.errorMessageConfirmPassword(
                                  snapshot.data,
                                  're-enter password',
                                  passwordController.text,
                                ),
                              ),
                              controller: repeatPasswordController,
                              placeholder: AppLocalizations.of(context).confirmPassword,
                              password: true,
                              validationMessage:
                              CustomFormValidation.errorMessageConfirmPassword(
                                snapshot.data,
                                'Re-enter password',
                                passwordController.text,
                              ),
                              textInputType: TextInputType.text,
                            );
                          },
                        ),
                      ),
                      const Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            visualDensity: const VisualDensity(horizontal: -4.0, vertical: -4.0),
                            value: isChecked,
                            side: const BorderSide(
                              color: AppColors.primaryColor
                            ),
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                                validateInputs();
                              });

                            },
                            activeColor: AppColors.primaryColor, // Make the actual checkbox transparent
                             // Set the check color to orange
                          ),
                          Flexible(
                            child: TextSmall(
                              AppLocalizations.of(context).agreement,
                              fontSize: 10,

                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: BusyButton(
                          title: AppLocalizations.of(context).buttonSignUp,
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.setupProfile);
                          },
                          disabled: !canSubmit,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextSmall(
                        AppLocalizations.of(context).alreadyHaveAccount,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RouteName.login);
                      },
                      child: TextSmall(
                        AppLocalizations.of(context).signIn,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
