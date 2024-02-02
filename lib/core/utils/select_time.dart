// import 'package:flutter/material.dart';
// import 'package:shipoka/app/styles/app_color.dart';
//
// Future<void> _selectTime(BuildContext context) async {
//   TimeOfDay? selectedTime;
//   final TimeOfDay? picked = await showTimePicker(
//     context: context,
//     initialTime: TimeOfDay.now(),
//     builder: (BuildContext context, Widget? child) {
//       return Theme(
//         data: ThemeData.light().copyWith(
//           timePickerTheme: TimePickerThemeData(
//             dayPeriodColor: MaterialStateColor.resolveWith((states) =>
//             states.contains(MaterialState.selected)
//                 ? AppColors.amPmColor
//                 : AppColors.white),
//             dayPeriodBorderSide: const BorderSide(
//               color: AppColors.dayPeriodColor, // Replace with your desired color
//               width: 1.0, // Replace with your desired width
//             ),
//             backgroundColor: AppColors.white,
//             hourMinuteColor: MaterialStateColor.resolveWith((states) =>
//             states.contains(MaterialState.selected)
//                 ? AppColors.buttonPink
//                 : AppColors.minuteColor),
//             hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
//             states.contains(MaterialState.selected)
//                 ? AppColors.primaryColor
//                 : AppColors.black),
//           ),
//           primaryColor: AppColors.primaryColor,
//           colorScheme: const ColorScheme.light(
//             // primaryContainer:AppColors.white ,
//             background: AppColors.white,
//             primary: AppColors.primaryColor,
//             onPrimary: Colors.white,
//             // surface: Colors.white,
//           ),
//           buttonTheme: const ButtonThemeData(
//             textTheme: ButtonTextTheme.primary,
//             buttonColor: Colors.orange, // Change the button color to orange
//           ),
//           dialogTheme: const DialogTheme(
//             backgroundColor: Colors.white,
//             surfaceTintColor:AppColors.white, // Change the dialog background color to white
//           ),
//         ),
//         child: child!,
//       );
//     },
//   );
//
//   if (picked != null && picked != selectedTime) {
//     selectedTime = picked;
//     setState(() {
//
//     });
//   }
// }

