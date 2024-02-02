import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/utils/tool_tip.dart';

class CreateShipment extends StatefulWidget {
  const CreateShipment({super.key});

  @override
  State<CreateShipment> createState() => _CreateShipmentState();
}

class _CreateShipmentState extends State<CreateShipment> {
  int? selectedValue;
  int? shipmentLocation;
  int? deliveryDestination;
  int? typeOfTrip;
  int? pickUpType;
  String instant = 'instant';
  String schedule = 'schedule';
  String? pickup;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            datePickerTheme:const DatePickerThemeData(
              surfaceTintColor: Colors.transparent,
              backgroundColor: AppColors.white,
            ) ,
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
              background: AppColors.white,
              onPrimary: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor, // button text color
              ),
            )
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              dayPeriodColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.selected)
                  ? AppColors.amPmColor
                  : AppColors.white),
              dayPeriodBorderSide: const BorderSide(
                color: AppColors.dayPeriodColor, // Replace with your desired color
                width: 1.0, // Replace with your desired width
              ),
              backgroundColor: AppColors.white,
              hourMinuteColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.selected)
                  ? AppColors.buttonPink
                  : AppColors.minuteColor),
              hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.selected)
                  ? AppColors.primaryColor
                  : AppColors.black),
            ),
            primaryColor: AppColors.primaryColor,
            colorScheme: const ColorScheme.light(
             // primaryContainer:AppColors.white ,
              background: AppColors.white,
              primary: AppColors.primaryColor,
              onPrimary: Colors.white,
              // surface: Colors.white,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              buttonColor: Colors.orange, // Change the button color to orange
            ),
            dialogTheme: const DialogTheme(
              backgroundColor: Colors.white,
              surfaceTintColor:AppColors.white, // Change the dialog background color to white
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Column(
                      children: [
                        const Gap(10),
                        Row(
                          children: [
                            const AppBackButton(),
                            const Gap(20),
                            TextSemiBold(
                              'Shipment Detail',
                              fontSize: 20,
                            ),


                          ],
                        ),
                        const Gap(35),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.greyBorderColor
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextSmall(
                                    'Select delivery type',
                                    color: AppColors.smallTextColor,
                                    fontSize: 14,
                                  ),
                                  const Gap(15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Radio(
                                        visualDensity: const VisualDensity(
                                          horizontal: VisualDensity.minimumDensity,
                                          vertical: VisualDensity.minimumDensity,
                                        ),
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        value: 1,
                                        groupValue: selectedValue,
                                        fillColor: MaterialStateColor.resolveWith(
                                              (Set<MaterialState> states) {
                                            if (states.contains(MaterialState.selected)) {
                                              return AppColors.primaryColor; // Color when selected
                                            }
                                            return AppColors.radioColor; // Color when not selected
                                          },
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedValue = value;
                                          });
                                        },
                                      ),
                                      const Gap(5),
                                      TextBody(
                                          'Standard',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      const Gap(10),
                                      Radio(
                                        visualDensity: const VisualDensity(
                                          horizontal: VisualDensity.minimumDensity,
                                          vertical: VisualDensity.minimumDensity,
                                        ),
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        value: 2,
                                        groupValue: selectedValue,
                                        fillColor: MaterialStateColor.resolveWith(
                                              (Set<MaterialState> states) {
                                            if (states.contains(MaterialState.selected)) {
                                              return AppColors.primaryColor; // Color when selected
                                            }
                                            return AppColors.radioColor; // Color when not selected
                                          },
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedValue = value;
                                          });
                                        },
                                      ),
                                      const Gap(5),
                                      TextBody('Express',fontWeight: FontWeight.w400,),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        const Gap(12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.greyBorderColor
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextSmall(
                                    'Select shipment location',
                                    color: AppColors.smallTextColor,
                                    fontSize: 14,
                                  ),
                                  const Gap(15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Radio(
                                        visualDensity: const VisualDensity(
                                          horizontal: VisualDensity.minimumDensity,
                                          vertical: VisualDensity.minimumDensity,
                                        ),
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        value: 1,
                                        groupValue: shipmentLocation,
                                        fillColor: MaterialStateColor.resolveWith(
                                              (Set<MaterialState> states) {
                                            if (states.contains(MaterialState.selected)) {
                                              return AppColors.primaryColor; // Color when selected
                                            }
                                            return AppColors.radioColor; // Color when not selected
                                          },
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            shipmentLocation = value;
                                          });
                                        },
                                      ),
                                      const Gap(2),
                                      TextBody(
                                        'Intra city',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      const Gap(5),
                                      Radio(
                                        visualDensity: const VisualDensity(
                                          horizontal: VisualDensity.minimumDensity,
                                          vertical: VisualDensity.minimumDensity,
                                        ),
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        value: 2,
                                        groupValue: shipmentLocation,
                                        fillColor: MaterialStateColor.resolveWith(
                                              (Set<MaterialState> states) {
                                            if (states.contains(MaterialState.selected)) {
                                              return AppColors.primaryColor; // Color when selected
                                            }
                                            return AppColors.radioColor; // Color when not selected
                                          },
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            shipmentLocation = value;
                                          });
                                        },
                                      ),
                                      const Gap(2),
                                      TextBody(
                                        'Inter state ',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      const Gap(5),
                                      Radio(
                                        visualDensity: const VisualDensity(
                                          horizontal: VisualDensity.minimumDensity,
                                          vertical: VisualDensity.minimumDensity,
                                        ),
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        value: 3,
                                        groupValue: shipmentLocation,
                                        fillColor: MaterialStateColor.resolveWith(
                                              (Set<MaterialState> states) {
                                            if (states.contains(MaterialState.selected)) {
                                              return AppColors.primaryColor; // Color when selected
                                            }
                                            return AppColors.radioColor; // Color when not selected
                                          },
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            shipmentLocation = value;
                                          });
                                        },
                                      ),
                                      const Gap(2),
                                      TextBody(
                                        'International',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        const Gap(12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.greyBorderColor
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextSmall(
                                    'Choose your delivery destination preference',
                                    color: AppColors.smallTextColor,
                                    fontSize: 14,
                                  ),
                                  const Gap(15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Radio(
                                        visualDensity: const VisualDensity(
                                          horizontal: VisualDensity.minimumDensity,
                                          vertical: VisualDensity.minimumDensity,
                                        ),
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        value: 1,
                                        groupValue: deliveryDestination,
                                        fillColor: MaterialStateColor.resolveWith(
                                              (Set<MaterialState> states) {
                                            if (states.contains(MaterialState.selected)) {
                                              return AppColors.primaryColor; // Color when selected
                                            }
                                            return AppColors.radioColor; // Color when not selected
                                          },
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            deliveryDestination = value;
                                          });
                                        },
                                      ),
                                      const Gap(5),
                                      TextBody('Single',fontWeight: FontWeight.w400,),
                                      const Gap(10),
                                      Radio(
                                        visualDensity: const VisualDensity(
                                          horizontal: VisualDensity.minimumDensity,
                                          vertical: VisualDensity.minimumDensity,
                                        ),
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        value: 2,
                                        groupValue: deliveryDestination,
                                        fillColor: MaterialStateColor.resolveWith(
                                              (Set<MaterialState> states) {
                                            if (states.contains(MaterialState.selected)) {
                                              return AppColors.primaryColor; // Color when selected
                                            }
                                            return AppColors.radioColor; // Color when not selected
                                          },
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            deliveryDestination = value;
                                          });
                                        },
                                      ),
                                      const Gap(5),
                                      TextBody('Multiple',fontWeight: FontWeight.w400,),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        const Gap(12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.greyBorderColor
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextSmall(
                                    'Choose your type of trip',
                                    color: AppColors.smallTextColor,
                                    fontSize: 14,
                                  ),
                                  const Gap(15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Radio(
                                        visualDensity: const VisualDensity(
                                          horizontal: VisualDensity.minimumDensity,
                                          vertical: VisualDensity.minimumDensity,
                                        ),
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        value: 1,
                                        groupValue: typeOfTrip,
                                        fillColor: MaterialStateColor.resolveWith(
                                              (Set<MaterialState> states) {
                                            if (states.contains(MaterialState.selected)) {
                                              return AppColors.primaryColor; // Color when selected
                                            }
                                            return AppColors.radioColor; // Color when not selected
                                          },
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            typeOfTrip = value;
                                          });
                                        },
                                      ),
                                      const Gap(5),
                                      TextBody('One Way',fontWeight: FontWeight.w400,),
                                      const Gap(10),
                                      Radio(
                                        visualDensity: const VisualDensity(
                                          horizontal: VisualDensity.minimumDensity,
                                          vertical: VisualDensity.minimumDensity,
                                        ),
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        value: 2,
                                        groupValue: typeOfTrip,
                                        fillColor: MaterialStateColor.resolveWith(
                                              (Set<MaterialState> states) {
                                            if (states.contains(MaterialState.selected)) {
                                              return AppColors.primaryColor; // Color when selected
                                            }
                                            return AppColors.radioColor; // Color when not selected
                                          },
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            typeOfTrip = value;
                                          });
                                        },
                                      ),
                                      const Gap(5),
                                      TextBody('Round Trip',fontWeight: FontWeight.w400,),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        const Gap(12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.greyBorderColor
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextSmall(
                                    ' Select your Pick up type',
                                    color: AppColors.smallTextColor,
                                    fontSize: 14,
                                  ),
                                  const Gap(15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Radio(
                                        visualDensity: const VisualDensity(
                                          horizontal: VisualDensity.minimumDensity,
                                          vertical: VisualDensity.minimumDensity,
                                        ),
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        value: 'instant',
                                        groupValue: pickup,
                                        fillColor: MaterialStateColor.resolveWith(
                                              (Set<MaterialState> states) {
                                            if (states.contains(MaterialState.selected)) {
                                              return AppColors.primaryColor; // Color when selected
                                            }
                                            return AppColors.radioColor; // Color when not selected
                                          },
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            pickup = value!;
                                          });
                                        },
                                      ),
                                      const Gap(5),
                                      TextBody('Instant',fontWeight: FontWeight.w400,),
                                      const Gap(10),
                                      Radio(
                                        visualDensity: const VisualDensity(
                                          horizontal: VisualDensity.minimumDensity,
                                          vertical: VisualDensity.minimumDensity,
                                        ),
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        value: 'schedule',
                                        groupValue:pickup ,
                                        fillColor: MaterialStateColor.resolveWith(
                                              (Set<MaterialState> states) {
                                            if (states.contains(MaterialState.selected)) {
                                              return AppColors.primaryColor; // Color when selected
                                            }
                                            return AppColors.radioColor; // Color when not selected
                                          },
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            pickup = value!;
                                          });
                                        },
                                      ),
                                      const Gap(5),
                                      TextBody('Schedule',fontWeight: FontWeight.w400,),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: BusyButton(
                    title: 'Continue',
                    onTap: () {
                      if (pickup == 'schedule') {
                        displayBottomModal(context);
                        // Proceed with your logic here
                      } else {
                        // Handle case where no option is selected
                        print('Please select an option');
                      }
                    },
                    disabled: false,
                  )
                ),
              ],
            ),
          )
      ),
    );
  }

  void displayBottomModal(BuildContext context) {
    showModalBottomSheet(
        shape:  const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
            )
        ),
        context: context,
        builder: (BuildContext context){
          SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, // Change this to your preferred status bar color
          ));
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.45,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextSemiBold(
                            'Scheduled Pickup Details',
                          fontWeight: FontWeight.w500,
                          fontSize: 22,

                        ),
                        const Gap(20),
                        GestureDetector(
                          onTap: (){
                               _selectDate(context);
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.textFieldBackground,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextSmall(
                                      'Date',
                                    color: AppColors.textSecondaryColor,
                                    fontSize: 12,
                                  ),
                                  const Gap(5),
                                  TextBody(
                                      '14th Oct. 2023',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Gap(15),
                        GestureDetector(
                          onTap: (){
                            _selectTime(context);
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.textFieldBackground,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextSmall(
                                    'Pick-up time',
                                    color: AppColors.textSecondaryColor,
                                    fontSize: 12,
                                  ),
                                  const Gap(5),
                                  TextBody(
                                    '5:50 pm',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Tooltip(
                                 message: 'This message is from tooltip...',
                                 padding: const EdgeInsets.all(20),
                                 showDuration: const Duration(seconds: 10),
                                 decoration: const ShapeDecoration(
                                   color: AppColors.textColor,
                                   shape: ToolTipCustomShape(),
                                 ),
                                 textStyle: const TextStyle(color: Colors.white),
                                 preferBelow: false,
                                 verticalOffset: 20,
                                 child:SvgPicture.asset(AppAssets.helpCircle)
                             ),
                           ],
                         ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextSmall('Your package will be collected by 2:30 PM on October 11, 2023'),
                        ),
                        const Gap(5),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: BusyButton(
                            color: AppColors.buttonBlack,
                            title: 'Continue',
                            onTap: () {  },

                          ),
                        ),
                      ],
                    ),
                  ],
              ),
            ),
          );
        }
    );
  }

}
