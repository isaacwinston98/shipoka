import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/app/view/widget/busy_button2.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/features/shipment/presentation/widgets/saved_location.dart';

class DestinationDetails extends StatefulWidget {
  const DestinationDetails({super.key});

  @override
  State<DestinationDetails> createState() => _DestinationDetailsState();
}

class _DestinationDetailsState extends State<DestinationDetails> {
  bool isSaved = false;
  String selectedCountryCode = '';
  bool payNow = true;
  bool payOnDelivery = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Column(
                children: [
                  const Gap(10),
                  Row(
                    children: [
                      const AppBackButton(),
                      const Gap(20),
                      TextSemiBold(
                        'Pickup & Delivery Detail',
                        fontSize: 20,
                      ),


                    ],
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(20),
                        TextBody(
                          'Destination Details',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        const Gap(5),
                        TextSmall(
                          'Provide specific details for your destination',
                          fontSize: 12,
                        ),
                        const Gap(20),
                        const Divider(
                          height: 1,
                          color: AppColors.greyBorderColor,
                        ),
                        const Gap(15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                              visualDensity: const VisualDensity(horizontal: -4.0, vertical: -4.0),
                              value: isSaved,
                              side: const BorderSide(
                                  color: AppColors.primaryColor
                              ),
                              onChanged: (bool? value) {
                                setState(() {
                                  isSaved = value!;
                                });

                              },
                              activeColor: AppColors.primaryColor, // Make the actual checkbox transparent
                              // Set the check color to orange
                            ),
                            const Gap(5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextBody(
                                  'Saved Locations',
                                  fontSize: 13,
                                ),
                                const Gap(3),
                                TextSmall(
                                  'Enable the option to view your saved locations',

                                )
                              ],
                            )
                          ],
                        ),
                        const Gap(10),
                        isSaved ?
                        const Column(
                          children: [
                            SavedLocation(),
                            Gap(10),
                            SavedLocation(),
                            Gap(10),
                            SavedLocation(),
                            Gap(10),
                            SavedLocation(),
                            Gap(10),
                            SavedLocation(),
                            Gap(10),
                            SavedLocation(),
                            Gap(10),
                            SavedLocation()
                          ],
                        )
                            : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(10),
                            const Divider(
                              height: 1,
                              color: AppColors.greyBorderColor,
                            ),
                            const Gap(10),
                            TextBody(
                              'Receiver Information',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            const Gap(1),
                            TextSmall(
                              'Please provide the receiver\'s details',
                              fontSize: 12,
                            ),
                            const Gap(14),
                            const Divider(
                              height: 1,
                              color: AppColors.greyBorderColor,
                            ),
                            const Gap(10),
                            const InputField(
                              placeholder: 'Receiver name',
                              textInputType: TextInputType.number,
                              controller: null,
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
                                    placeholder: 'Receiver Phone Number',
                                    textInputType: TextInputType.number,
                                    controller: null,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(10),
                            const InputField(
                              placeholder: 'Receiver Email ',
                              textInputType: TextInputType.number,
                              controller: null,
                            ),
                            const Gap(10),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.textFieldBackground
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 22),
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
                                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                            const Gap(10),
                            const InputField(
                              placeholder: 'Delivery Instructions (optional)',
                              textInputType: TextInputType.number,
                              controller: null,
                            ),
                            const Gap(10),
                            TextSmall(
                              'Mode of Payment',
                              fontWeight: FontWeight.w500,

                            ),
                            const Gap(6),
                            const Divider(
                              height: 1,
                              color: AppColors.greyBorderColor,
                            ),
                            const Gap(0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 30,
                                  child: Transform.scale(
                                    scale: 0.6,
                                    child: Switch(
                                        value: payNow,
                                        activeColor: AppColors.white,
                                        inactiveThumbColor: AppColors.white,
                                        activeTrackColor:AppColors.primaryColor,
                                        inactiveTrackColor: AppColors.personalProfileHint,
                                        onChanged: (onChange){
                                          setState(() {
                                            payNow = onChange;
                                          });

                                        }),
                                  ),
                                ),
                                TextSmall(
                                    'Pay now at checkout',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                                Gap(10),
                                Transform.scale(
                                  scale: 0.6,
                                  child: Switch(
                                      value: payOnDelivery,
                                      activeColor: AppColors.white,
                                      inactiveThumbColor: AppColors.white,
                                      activeTrackColor:AppColors.primaryColor,
                                      inactiveTrackColor: AppColors.personalProfileHint,
                                      onChanged: (onChange){
                                        setState(() {
                                          payOnDelivery = onChange;
                                        });

                                      }),
                                ),
                                TextSmall(
                                    'Pay on delivery',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 16),
                              child: BusyButton2(
                                title: 'Add this Detail',
                                disabled: true,
                                onTap: () {  },
                              )
                            ),

                          ],
                        ),
                      ]),
                ),

              )
            ],
          ),
        ), ),
    );
  }
}
