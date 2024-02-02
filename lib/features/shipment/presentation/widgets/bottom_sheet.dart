import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';

void showCustomBottomSheet(BuildContext context, GlobalKey key) {
  final RenderBox renderBox = key.currentContext!.findRenderObject()! as RenderBox;
  final componentPosition = renderBox.localToGlobal(Offset.zero);
  final GlobalKey secondComponentKey = GlobalKey();

  double sheetHeight = MediaQuery.of(context).size.height - componentPosition.dy;

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
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Container(

            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8,
            child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextSemiBold('Scheduled Pickup Details'),
                      Gap(20),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.textFieldBackground,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            TextSmall('Date'),
                            Gap(5),
                            TextBody('14th Oct. 2023'),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
  );
}
