import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';
import 'package:shipoka/core/utils/custom_form_validator.dart';

class PersonalProfile extends StatefulWidget {
  const PersonalProfile({super.key});

  @override
  State<PersonalProfile> createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> {

  File? image;



  late StreamController<String> _firstNameStreamController;
  late StreamController<String> _surnameStreamController;
  late StreamController<String> _phoneStreamController;


  final firstNameFocus = FocusNode();
  final surnameFocus = FocusNode();
  final phoneFocus = FocusNode();


  final firstNameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
  final searchController = TextEditingController();


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

  //Image Picker method to select image from gallery or camera
  Future pickImage(ImageSource source)async{
   try {
     final image =  await ImagePicker().pickImage(source: source);
     if(image == null)return;
     final temporaryImage = File(image.path);
     setState(() {
       this.image = temporaryImage;
     });
   } on PlatformException catch (e) {
    //
   }

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
                        const Gap(15),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              height:130,
                              width:130,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.editPersonColor,
                              ),
                              child: image != null
                              ? ClipOval(
                                child: Image.file(
                                  image!,
                                  width: 130.0,
                                  height: 130.0,
                                  fit: BoxFit.cover,
                                ),
                              )
                              : Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: SvgPicture.asset(
                                  width: 60,
                                  AppAssets.user,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -10,
                              right: 0,
                              child: IconButton(
                                icon: SvgPicture.asset(
                                  AppAssets.edit,
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    backgroundColor: AppColors.white,
                                    showDragHandle: true,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)
                                          )
                                      ),
                                      context: context,
                                      builder: (BuildContext context){
                                        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                                          statusBarColor: Colors.transparent, // Change this to your preferred status bar color
                                        ));
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 15,),
                                          child: SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.2,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    TextSemiBold(
                                                      'Upload Image',
                                                      fontSize: 17,
                                                    ),
                                                  ],
                                                ),
                                                const Gap(20),
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: (){
                                                          pickImage(ImageSource.camera);
                                                          Navigator.pop(context);

                                                        },
                                                        child: Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              AppAssets.camera,
                                                            ),
                                                            const Gap(10),
                                                            TextBody(
                                                                'Take a picture',
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 16,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      const Gap(20),
                                                      GestureDetector(
                                                        onTap: (){
                                                          pickImage(ImageSource.gallery);
                                                          Navigator.pop(context);
                                                        },
                                                        child: Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              AppAssets.gallery,
                                                            ),
                                                            const Gap(10),
                                                            TextBody(
                                                                'Choose from gallery',
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 16,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      const Gap(10),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                  );
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Country Code Dropdown
                            GestureDetector(
                              onTap: (){
                                showModalBottomSheet(
                                  showDragHandle: true,
                                  backgroundColor: AppColors.white,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)
                                        )
                                    ),
                                    context: context,
                                    builder: (BuildContext context){
                                      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                                        statusBarColor: Colors.transparent, // Change this to your preferred status bar color
                                      ));
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                        child: SizedBox(

                                          height: MediaQuery.of(context).size.height * 0.38,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  TextSemiBold(
                                                    'Select your country',
                                                    fontSize: 17,
                                                  ),
                                                ],
                                              ),
                                              const Gap(15),
                                              InputField(
                                                  controller: searchController,
                                                  placeholder: 'Search Country',
                                                  suffix: SvgPicture.asset(
                                                  AppAssets.search,
                                                ),
                                              ),
                                              const Gap(20),
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.asset(AppAssets.flag),
                                                                const Gap(10),
                                                                TextBody(
                                                                    'Afghanistan',
                                                                  fontWeight: FontWeight.w500,
                                                                )
                                                              ],
                                                            ),
                                                            TextBody(
                                                              '(+93)',
                                                              fontWeight: FontWeight.w500,
                                                            )

                                                          ],
                                                        ),
                                                        const Gap(15),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.asset(AppAssets.flag),
                                                                const Gap(10),
                                                                TextBody(
                                                                  'Afghanistan',
                                                                  fontWeight: FontWeight.w500,
                                                                )
                                                              ],
                                                            ),
                                                            TextBody(
                                                              '(+93)',
                                                              fontWeight: FontWeight.w500,
                                                            )

                                                          ],
                                                        ),
                                                        const Gap(15),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.asset(AppAssets.flag),
                                                                const Gap(10),
                                                                TextBody(
                                                                  'Afghanistan',
                                                                  fontWeight: FontWeight.w500,
                                                                )
                                                              ],
                                                            ),
                                                            TextBody(
                                                              '(+93)',
                                                              fontWeight: FontWeight.w500,
                                                            )

                                                          ],
                                                        ),
                                                        const Gap(15),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.asset(AppAssets.flag),
                                                                const Gap(10),
                                                                TextBody(
                                                                  'Afghanistan',
                                                                  fontWeight: FontWeight.w500,
                                                                )
                                                              ],
                                                            ),
                                                            TextBody(
                                                              '(+93)',
                                                              fontWeight: FontWeight.w500,
                                                            )

                                                          ],
                                                        ),
                                                        const Gap(15),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.asset(AppAssets.flag),
                                                                const Gap(10),
                                                                TextBody(
                                                                  'Afghanistan',
                                                                  fontWeight: FontWeight.w500,
                                                                )
                                                              ],
                                                            ),
                                                            TextBody(
                                                              '(+93)',
                                                              fontWeight: FontWeight.w500,
                                                            )

                                                          ],
                                                        ),
                                                        const Gap(15),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.asset(AppAssets.flag),
                                                                const Gap(10),
                                                                TextBody(
                                                                  'Afghanistan',
                                                                  fontWeight: FontWeight.w500,
                                                                )
                                                              ],
                                                            ),
                                                            TextBody(
                                                              '(+93)',
                                                              fontWeight: FontWeight.w500,
                                                            )

                                                          ],
                                                        ),
                                                        const Gap(15),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.asset(AppAssets.flag),
                                                                const Gap(10),
                                                                TextBody(
                                                                  'Afghanistan',
                                                                  fontWeight: FontWeight.w500,
                                                                )
                                                              ],
                                                            ),
                                                            TextBody(
                                                              '(+93)',
                                                              fontWeight: FontWeight.w500,
                                                            )

                                                          ],
                                                        ),
                                                        const Gap(15),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.asset(AppAssets.flag),
                                                                const Gap(10),
                                                                TextBody(
                                                                  'Afghanistan',
                                                                  fontWeight: FontWeight.w500,
                                                                )
                                                              ],
                                                            ),
                                                            TextBody(
                                                              '(+93)',
                                                              fontWeight: FontWeight.w500,
                                                            )

                                                          ],
                                                        ),
                                                        const Gap(15),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.asset(AppAssets.flag),
                                                                const Gap(10),
                                                                TextBody(
                                                                  'Afghanistan',
                                                                  fontWeight: FontWeight.w500,
                                                                )
                                                              ],
                                                            ),
                                                            TextBody(
                                                              '(+93)',
                                                              fontWeight: FontWeight.w500,
                                                            )

                                                          ],
                                                        ),
                                                        const Gap(15),

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
                                        TextSmall('Code'),
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
                      ],

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: BusyButton(
                    title: 'Continue',
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.getOTP);
                    },
                    // disabled: true,
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
