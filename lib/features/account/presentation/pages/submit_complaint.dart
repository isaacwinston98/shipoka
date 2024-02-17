import 'dart:io'; // Import dart:io for File class
import 'package:country_picker/country_picker.dart';
import 'package:dotted_border/dotted_border.dart';
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

class SubmitComplaint extends StatefulWidget {
  const SubmitComplaint({super.key});

  @override
  State<SubmitComplaint> createState() => _SubmitComplaintState();
}

class _SubmitComplaintState extends State<SubmitComplaint> {
  String selectedCountryCode = '';
  File? image;
  Future pickImage(ImageSource source)async{
    try {
      final image =  await ImagePicker().pickImage(source: source);
      if(image == null)return;
      final temporaryImage = File(image.path);
      setState(() {
        this.image = temporaryImage;
      });
    } on PlatformException catch () {
      //
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    const AppBackButton(),
                    const Gap(30),
                    TextSemiBold(
                      'Submit Complaint',
                      fontSize: 20,
                    ),
                  ],
                ),
                const Gap(20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextSmall(
                                      "We value your feedback and aim to provide the best experience.",
                                      fontSize: 16
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Gap(40),
                        TextField(
                          cursorColor: AppColors.primaryColor,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.lightBackground,
                            hintText: 'Submit',
                            hintStyle: const TextStyle(fontSize: 12),
                            contentPadding: const EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const Gap(10),
                        TextField(
                          cursorColor: AppColors.primaryColor,
                          minLines: null, // Allow the TextField to expand vertically as needed
                          maxLines: 5,    // Set the maximum number of lines to expand
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.lightBackground,
                            hintText: 'Complaint Category',
                            hintStyle: const TextStyle(fontSize: 12),
                            contentPadding: const EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const Gap(20),
                        Row(
                          children: [
                            DottedBorder(
                              color: AppColors.personalProfileHint,
                              dashPattern: [5,2],
                              radius: const Radius.circular(20),
                              borderType: BorderType.RRect,
                              strokeWidth: 1,
                              child: Container(
                                width: 170,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        image != null
                                            ?Image.file(
                                          image!,
                                          width: 50.0,
                                          height: 30.0,
                                          fit: BoxFit.cover,
                                        )
                                            :Container(),

                                        TextBody(
                                          'File Upload',
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.primaryColor,
                                        ),
                                        const Gap(5),
                                        TextBody(
                                          '(Optional)',
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.personalProfileHint,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(20),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextSemiBold(
                                  "Contact Information",
                                  fontSize: 16, ),
                              ],
                            ),
                          ],
                        ),
                        const Gap(20),
                        const Divider(
                          height: 1,
                          color: AppColors.dividerGrey,
                        ),
                        const Gap(20),
                        TextField(
                          cursorColor: AppColors.primaryColor,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.lightBackground,
                            hintText: 'Name',
                            hintStyle: const TextStyle(fontSize: 12),
                            contentPadding: const EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const Gap(20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Country Code Dropdown
                            GestureDetector(
                              onTap: (){
                                showCountryPicker(
                                    context: context,
                                    showPhoneCode: true,
                                    countryListTheme: CountryListThemeData(
                                      flagSize: 25,
                                      backgroundColor: Colors.white,
                                      textStyle: const TextStyle(fontSize: 16, color: AppColors.textColor),
                                      bottomSheetHeight: MediaQuery.of(context).size.height * 0.9,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0),
                                      ),
                                      inputDecoration: InputDecoration(
                                        fillColor: AppColors.textFieldBackground,
                                        hintText: 'Search Country',
                                        suffix: SvgPicture.asset(
                                            AppAssets.search
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onSelect: (Country country){
                                      setState(() {
                                        selectedCountryCode = country.phoneCode; // Update the selected country code
                                      });
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
                                        TextSmall(
                                          selectedCountryCode == ''
                                              ? '+234'
                                              : "+$selectedCountryCode",
                                          fontWeight:FontWeight.w500,

                                        ),
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
                            const Expanded(
                              child: InputField(
                                placeholder: 'Phone Number',
                                textInputType: TextInputType.number,
                                controller: null,
                              ),
                            ),
                          ],
                        ),
                        const Gap(20),
                        TextField(
                          cursorColor: AppColors.primaryColor,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.lightBackground,
                            hintText: 'Email',
                            hintStyle: const TextStyle(fontSize: 12),
                            contentPadding: const EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const Gap(40),
                        BusyButton(
                          title: 'Submit',
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.security);
                          },
                        ),
                      ],
                    ),


                  ),
                ),


              ],
            ),
          )
      )
    );
  }
}
