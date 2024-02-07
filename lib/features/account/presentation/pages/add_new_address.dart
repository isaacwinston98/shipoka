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

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({super.key});

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  String selectedCountryCode = '';
  bool isChecked = false;
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const AppBackButton(),
                            const Gap(20),
                            TextSemiBold(
                              'Add New Address',
                              fontSize: 20,
                            ),
                          ],
                        ),
                      ),
                      const Gap(30),
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
                      const Gap(15),
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
                      const Gap(15),
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
                      const Gap(15),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.textFieldBackground
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextSmall(
                                'country/Region',
                                color: AppColors.personalProfileHint,
                              ),
                              const Icon(
                                  Icons.arrow_drop_down_outlined
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(10),
                      const InputField(
                        placeholder: 'Address eg 123 kent street',
                        textInputType: TextInputType.number,
                        controller: null,
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          const Expanded(
                            child:InputField(
                              placeholder: 'City',
                              textInputType: TextInputType.number,
                              controller: null,
                            ),
                          ),
                          const Gap(5),
                          Expanded(
                              child:Container(
                                decoration: BoxDecoration(
                                  color: AppColors.textFieldBackground,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextSmall(
                                        'State',
                                        color: AppColors.personalProfileHint,
                                      ),
                                      const Icon(
                                          Icons.arrow_drop_down_outlined
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          )
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              child: BusyButton(
                title: 'Add Address',
                onTap: (){
                  //Navigator.pushNamed(context, RouteName.;
                  _handleContinueButton();
                },
                //disabled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleContinueButton() {
    // Implement the logic for setting new password

    // Assuming the password change is successful, show the success dialog
    _showSuccessDialog();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dialog dismissal on outside tap
      builder: (BuildContext context) {
        // Timer(Duration(seconds: 3), () {
        //   Navigator.of(context).pop(); // Dismiss the dialog after 3 seconds
        // });

        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30.0,),
              Padding(
                padding: EdgeInsets.only(right: 8.0, top: 10.0),
                child: Container(
                  padding: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/location.svg', // Provide your asset path here
                    width: 50, // Adjust width as needed
                    height: 50, // Adjust height as needed
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              Text(
                'Address Added',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15.0),
              Center(
                child: Text(
                  'Your have successfully edited your profile details.',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 100.0),
              BusyButton(
                title: 'Ok',
                onTap: () {
                  Navigator.pushNamed(context, RouteName.userAccountAddress);
                },
              )
            ],
          ),
          backgroundColor: Colors.white,
        );
      },
    );
  }
}