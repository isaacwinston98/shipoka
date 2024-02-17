import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';
import 'package:shipoka/features/shipment/presentation/changeNotifier/shipment_notifier.dart';
import 'package:shipoka/features/shipment/presentation/widgets/location_form.dart';
import 'package:shipoka/features/shipment/presentation/widgets/saved_location.dart';

class SenderInformation extends StatefulWidget {
  const SenderInformation({super.key});

  @override
  State<SenderInformation> createState() => _SenderInformationState();
}

class _SenderInformationState extends State<SenderInformation> {
  String selectedCountryCode = '';
  bool isChecked = false;
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    final shipmentProvider = Provider.of<ShipmentProvider>(context);
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
                         'Sender Information',
                         fontSize: 15,
                         fontWeight: FontWeight.w500,
                       ),
                       const Gap(5),
                       TextSmall(
                         'Please provide the sender\'s details',
                         fontSize: 12,
                       ),
                       const Gap(20),
                       const Divider(
                         height: 1,
                         color: AppColors.dividerGrey,
                       ),
                       const Gap(25),
                       TextField(
                         cursorColor: AppColors.primaryColor,
                         decoration: InputDecoration(
                           filled: true,
                           fillColor: AppColors.lightBackground,
                           hintText: 'Sender Name',
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
                               placeholder: 'Sender Phone Number',
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
                           hintText: 'Sender Email',
                           hintStyle: const TextStyle(fontSize: 12),
                           contentPadding: const EdgeInsets.all(15),
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide.none,
                           ),
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
                               });

                             },
                             activeColor: AppColors.white,
                             checkColor: AppColors.primaryColor,
                           ),
                           Flexible(
                             child: TextSmall(
                               'Pickup information is the same as the sender location',
                               fontSize: 10,

                             ),
                           ),
                         ],
                       ),
                       const Gap(15),
                       TextBody(
                         'Pick Up location',
                         fontSize: 15,
                         fontWeight: FontWeight.w500,
                       ),
                       const Gap(20),
                       const Divider(
                         height: 1,
                         color: AppColors.dividerGrey,
                       ),
                       const Gap(15),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Checkbox(
                             visualDensity: const VisualDensity(horizontal: -4.0, vertical: -4.0),
                             value: shipmentProvider.showSavedLocation,
                             side: const BorderSide(
                                 color: AppColors.primaryColor
                             ),
                             onChanged: (bool? value) {
                               shipmentProvider.updateShowSavedLocation();

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
                       const Gap(20),
                       shipmentProvider.showSavedLocation
                           ? const Column(
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
                           : const LocationForm(),
                       const Gap(40),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                         child: BusyButton(
                             title: 'Continue',
                             onTap: (){
                               Navigator.pushNamed(context, RouteName.packageDetails);
                             }),
                       )
                     ],
                   ),
                 ),
               ),



              ],
            ),
          ), ),
    );
  }
}


