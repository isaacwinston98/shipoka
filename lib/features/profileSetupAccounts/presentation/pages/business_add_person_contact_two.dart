import 'package:country_picker/country_picker.dart';
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

class BusinessAddPersonContactTwo extends StatefulWidget {
  const BusinessAddPersonContactTwo({super.key});

  @override
  State<BusinessAddPersonContactTwo> createState() => _BusinessAddPersonContactTwoState();
}

class _BusinessAddPersonContactTwoState extends State<BusinessAddPersonContactTwo> {
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
                            "Add Person Contact",
                            style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      TextSmall(
                          'Youre Just One Step Away from Completion: '
                          'Share Your Business Contact Info'
                      ),
                      const Gap(30),
                      TextField(
                        cursorColor: AppColors.primaryColor,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.lightBackground,
                          hintText: 'Contact First Name',
                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          //floatingLabelBehavior: FloatingLabelBehavior.always, // Display label text always
                        ),
                      ),
                      const Gap(10),
                      TextField(
                        cursorColor: AppColors.primaryColor,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.lightBackground,
                          hintText: 'Contact Last Name',
                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          //floatingLabelBehavior: FloatingLabelBehavior.always, // Display label text always
                        ),
                      ),
                      const Gap(10),
                      TextField(
                        cursorColor: AppColors.primaryColor,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.lightBackground,
                          hintText: 'Contact Email Address',
                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          //floatingLabelBehavior: FloatingLabelBehavior.always, // Display label text always
                        ),
                      ),
                      const Gap(10),
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
                                            ? 'code'
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
                      //Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 00, 20, 8),
              child: BusyButton(
                title: 'Continue',
                onTap: () {
                  Navigator.pushNamed(context, RouteName.loginTwo);
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
