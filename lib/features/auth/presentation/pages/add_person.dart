import 'package:flutter/material.dart';

class AddPersonContact extends StatefulWidget {
  const AddPersonContact({super.key});

  @override
  State<AddPersonContact> createState() => _AddPersonContactState();
}

class _AddPersonContactState extends State<AddPersonContact> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
                              'Fill Business Detail ',
                              fontSize: 20,
                            ),


                          ],
                        ),
                        const Gap(25),
                        Column(
                          children: [
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
                            Gap(5),
                            TextSmall('Business logo')
                          ],
                        ),
                        const Gap(20),
                        StreamBuilder<String>(
                          stream: _surnameStreamController.stream,
                          builder: (context, snapshot) {
                            return InputField(
                              fieldFocusNode: surnameFocus,
                              label: 'Business name',
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
                              placeholder: 'Business type',
                              validationMessage: CustomFormValidation.errorMessage(
                                snapshot.data,
                                'LastName is required',
                              ),
                            );
                          },
                        ),
                        StreamBuilder<String>(
                          stream: _firstNameStreamController.stream,
                          builder: (context, snapshot) {
                            return InputField(
                              label: 'Business name',
                              suffix: Icon(
                                  Icons.arrow_drop_down
                              ),
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
                              placeholder: 'Business name',
                              validationMessage: CustomFormValidation.errorMessage(
                                snapshot.data,
                                'First name is required',
                              ),
                            );
                          },
                        ),
                        StreamBuilder<String>(
                          stream: _firstNameStreamController.stream,
                          builder: (context, snapshot) {
                            return InputField(
                              label: 'Business name',
                              suffix: Icon(
                                  Icons.arrow_drop_down
                              ),
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
                              placeholder: 'Employee size',
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
                              label: 'Business type',
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
                              placeholder: 'Business registration number',
                              validationMessage: CustomFormValidation.errorMessage(
                                snapshot.data,
                                'LastName is required',
                              ),
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
                    title: 'Next',
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
