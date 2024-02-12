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

class BusinessProfile extends StatefulWidget {
  const BusinessProfile({super.key});

  @override
  State<BusinessProfile> createState() => _BusinessProfileState();
}

class _BusinessProfileState extends State<BusinessProfile> {

  File? image;

  late StreamController<String> _firstNameStreamController;
  late StreamController<String> _surnameStreamController;
  late StreamController<String> _phoneStreamController;
  late StreamController<String> _businessRegistrationNumberStreamController;


  final firstNameFocus = FocusNode();
  final surnameFocus = FocusNode();
  final phoneFocus = FocusNode();
  final businessRegistrationNumberFocus = FocusNode();

  final firstNameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
  final businessRegistrationNumberController = TextEditingController();

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
  void initState() {
    super.initState();
    _firstNameStreamController = StreamController<String>.broadcast();
    _surnameStreamController = StreamController<String>.broadcast();
    _phoneStreamController = StreamController<String>.broadcast();
    _businessRegistrationNumberStreamController = StreamController<String>.broadcast();


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

    businessRegistrationNumberController.addListener(() {
      _businessRegistrationNumberStreamController.sink.add(
        businessRegistrationNumberController.text.trim(),
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
    _businessRegistrationNumberStreamController.close();


    firstNameFocus.dispose();
    surnameFocus.dispose();
    phoneFocus.dispose();
    businessRegistrationNumberFocus.dispose();

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

    final businessRegNumberError = CustomFormValidation.errorMessage(
      businessRegistrationNumberController.text,
      'Business Registration number is required',
    );

    if (
    firstNameError != '' ||
        surnameError != '' ||
        phoneError != '' ||
        businessRegNumberError != ''
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
                              'Fill Business Detail ',
                              fontSize: 20,
                            ),


                          ],
                        ),
                        const Gap(15),
                        Column(
                          children: [
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
                                              child: Container(
                                                color: AppColors.editPersonColor,
                                                height: MediaQuery.of(context).size.height * 0.25,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Gap(10),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          height: 3.0,
                                                          width: 50,
                                                          color: Colors.grey,
                                                        ),
                                                      ],
                                                    ),
                                                    const Gap(15),
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
                            const Gap(5),
                            TextSmall('Business logo')
                          ],
                        ),
                        const Gap(20),
                        StreamBuilder<String>(
                          stream: _surnameStreamController.stream,
                          builder: (context, snapshot) {
                            return InputField(
                              fieldFocusNode: surnameFocus,
                              validationColor: snapshot.data == null
                                  ? AppColors.white
                                  : CustomFormValidation.getColor(
                                snapshot.data,
                                surnameFocus,
                                CustomFormValidation.errorMessage(
                                  snapshot.data,
                                  'Business Name is required',
                                ),
                              ),
                              controller: surnameController,
                              placeholder: 'Business Name',
                              validationMessage: CustomFormValidation.errorMessage(
                                snapshot.data,
                                'Business Name is required',
                              ),
                            );
                          },
                        ),
                        GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)
                                    )
                                ),
                                context: context,
                                showDragHandle: true,
                                builder: (BuildContext context){
                                  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                                    statusBarColor: Colors.transparent, // Change this to your preferred status bar color
                                  ));
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                    child: SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.28,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Gap(10),
                                          const Gap(15),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              TextSemiBold(
                                                'Business Type',
                                                fontSize: 17,
                                              ),
                                            ],
                                          ),
                                          const Gap(20),
                                          Expanded(
                                            child: SingleChildScrollView(
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    TextBody(
                                                      'Fashion',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    const Gap(13),
                                                    TextBody(
                                                      'Healthcare',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    const Gap(13),
                                                    TextBody(
                                                      'Real Estate',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    const Gap(13),
                                                    TextBody(
                                                        'Agriculture',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    const Gap(13),
                                                    TextBody(
                                                        'Painting',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    const Gap(13),
                                                    TextBody(
                                                        'Media',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    const Gap(13),
                                                    TextBody(
                                                        'Education',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    const Gap(13),
                                                    TextBody('Politics'),
                                                    const Gap(13),
                                                    TextBody('text'),
                                                    const Gap(13),
                                                    TextBody('text'),
                                                    const Gap(10),
                                                    TextBody('text'),
                                                    const Gap(10),
                                                    TextBody('text'),
                                                    TextBody('text'),
                                                    TextBody('text'),
                                                    TextBody('text'),
                                                    TextBody('text'),
                                                    TextBody('text'),
                                                    TextBody('text'),
                                                    TextBody('text'),
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
                            decoration: BoxDecoration(
                                color: AppColors.textFieldBackground,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextSmall(
                                    'Business  Type',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.personalProfileHint,
                                  ),
                                  const Icon(
                                      Icons.arrow_drop_down
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
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
                                     height: MediaQuery.of(context).size.height * 0.28,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Gap(10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 3.0,
                                                width: 50,
                                                color: Colors.grey,
                                              ),
                                            ],
                                          ),
                                          const Gap(15),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              TextSemiBold(
                                                'Employee Size',
                                                fontSize: 17,
                                              ),
                                            ],
                                          ),
                                          const Gap(20),
                                          Expanded(
                                            child: SingleChildScrollView(
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    TextBody(
                                                        '0 - 10',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    const Gap(12),
                                                    TextBody(
                                                        '11 - 50',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    const Gap(12),
                                                    TextBody(
                                                        '51 - 100',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    const Gap(12),
                                                    TextBody(
                                                        '101 - 1000',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    const Gap(12),
                                                    TextBody(
                                                        '1001 - 5000',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    const Gap(12),
                                                    TextBody(
                                                        'Above 5000',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    const Gap(12),
                                                    TextBody('Education'),
                                                    const Gap(12),
                                                    TextBody('Politics'),
                                                    const Gap(12),
                                                    TextBody('text'),
                                                    const Gap(12),
                                                    TextBody('text'),
                                                    const Gap(10),
                                                    TextBody('text'),
                                                    const Gap(10),
                                                    TextBody('text'),
                                                    TextBody('text'),
                                                    TextBody('text'),
                                                    TextBody('text'),
                                                    TextBody('text'),
                                                    TextBody('text'),
                                                    TextBody('text'),
                                                    TextBody('text'),
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
                            decoration: BoxDecoration(
                                color: AppColors.textFieldBackground,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextSmall(
                                    'Employee size',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.personalProfileHint,
                                  ),
                                  const Icon(
                                      Icons.arrow_drop_down
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        StreamBuilder<String>(
                          stream: _businessRegistrationNumberStreamController.stream,
                          builder: (context, snapshot) {
                            return InputField(
                              fieldFocusNode: businessRegistrationNumberFocus,
                              validationColor: snapshot.data == null
                                  ? AppColors.white
                                  : CustomFormValidation.getColor(
                                snapshot.data,
                                businessRegistrationNumberFocus,
                                CustomFormValidation.errorMessage(
                                  snapshot.data,
                                  'LastName is required',
                                ),
                              ),
                              controller: businessRegistrationNumberController,
                              placeholder: 'Business registration number',
                              validationMessage: CustomFormValidation.errorMessage(
                                snapshot.data,
                                'Business Registration number is required',
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
                     Navigator.pushNamed(context, RouteName.addPersonContact);
                    },
                    disabled: false,
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
