import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class BusinessSetUpProfile extends StatefulWidget {
  const BusinessSetUpProfile({super.key});

  @override
  State<BusinessSetUpProfile> createState() => _BusinessSetUpProfileState();
}

class _BusinessSetUpProfileState extends State<BusinessSetUpProfile> {
  String selectedCountryCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              child: AppBackButton(),
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          //Text at the center Top
                          TextSemiBold(
                            "Fill Business Details",
                            style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.lightBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: SvgPicture.asset(AppAssets.user),
                                ),
                              ),
                              Positioned(
                                bottom: -30,
                                right: 0,
                                child: GestureDetector(
                                  // Inside your GestureDetector onTap handler for the edit icon
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 200, // Adjust the height as needed
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                height: 4, // Height of the draggable handle
                                                width: 20, // Width of the draggable handle
                                                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 130),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.withOpacity(0.9),
                                                  borderRadius: BorderRadius.circular(2),
                                                ),
                                              ),
                                              TextSemiBold(
                                                'Upload Image',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              const Gap(20),
                                              // First Row
                                              ListTile(
                                                dense: true,
                                                leading: SvgPicture.asset(AppAssets.camera),
                                                title: Text('Take a picture'),
                                                onTap: () async {
                                                  // Close the bottom sheet
                                                  Navigator.pop(context);
                                                },
                                              ),

                                              // Second Row
                                              ListTile(
                                                dense: true,
                                                leading:  SvgPicture.asset(AppAssets.gallery),
                                                title: Text(
                                                  'Choose from Gallery',
                                                ),
                                                onTap: () {
                                                  // Handle upload from gallery action
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },


                                  child: Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: SvgPicture.asset(AppAssets.edit),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Gap(20),
                      TextField(
                        cursorColor: AppColors.primaryColor,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.lightBackground,
                          hintText: 'Businss Name',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.personalProfileHint,
                            fontSize: 12,
                          ),
                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          //floatingLabelBehavior: FloatingLabelBehavior.always, // Display label text always
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
                      TextField(
                        cursorColor: AppColors.primaryColor,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.lightBackground,
                          hintText: 'Business Registeration Number (Optional)',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.personalProfileHint,
                            fontSize: 12,
                          ),
                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          //floatingLabelBehavior: FloatingLabelBehavior.always, // Display label text always
                        ),
                      ),
                      //Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 00, 20, 8),
              child: BusyButton(
                title: 'Next',
                onTap: () {
                  Navigator.pushNamed(context, RouteName.businessAddPersonContactTwo);
                },// Placeholder function for disabled state
                disabled: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
