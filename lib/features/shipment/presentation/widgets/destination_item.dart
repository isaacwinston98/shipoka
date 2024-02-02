import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/busy_button2.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/features/shipment/presentation/widgets/custom_dialog.dart';
import 'package:shipoka/features/shipment/presentation/widgets/saved_location.dart';

class DestinationItem extends StatefulWidget {
  const DestinationItem({
    super.key,
  });

  @override
  State<DestinationItem> createState() => _DestinationItemState();
}

class _DestinationItemState extends State<DestinationItem> {
  @override
  Widget build(BuildContext context) {
    bool isSaved = false;
    String selectedCountryCode = '';
    bool payNow = true;
    bool payOnDelivery = false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.greyBorderColor,
          borderRadius: BorderRadius.circular(10),

        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextSmall(
                    'Joseph Jones',
                    fontWeight: FontWeight.w500,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
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
                                  isScrollControlled: true,
                                  builder: (BuildContext context){
                                    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                                      statusBarColor: Colors.transparent, // Change this to your preferred status bar color
                                    ));
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                      child: SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.8,
                                        child: SingleChildScrollView(
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children :[
                                                        Container(
                                                          height: 50,
                                                          width: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            TextBody(
                                                              'Edit Delivery Details'
                                                            )
                                                          ],
                                                        ),

                                                        GestureDetector(
                                                          onTap: (){
                                                            Navigator.pop(context);
                                                          },
                                                          child: const Icon(
                                                            Icons.close,
                                                            size: 15,
                                                          ),
                                                        )
                                                      ]
                                                    ),
                                                    const Gap(10),
                                                    const Divider(
                                                      height: 1,
                                                      color: AppColors.borderColor,
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
                                                        const Gap(10),
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
                                      ),
                                    );
                                  }
                              );
                            },
                              child: SvgPicture.asset(
                                  AppAssets.reEdit,),
                          ),
                          const Gap(20),
                          GestureDetector(
                            onTap: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                                    statusBarColor: Colors.transparent, // Change this to your preferred status bar color
                                  ));
                                  return const CustomDialog();
                                },
                              );
                            },
                              child: SvgPicture.asset(
                                  AppAssets.trash),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              TextSmall('23 Chicago street, Gwarinpa, Abuja')
            ],
          ),
        ),
      ),
    );
  }
}