import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';

class SubmitComplaint extends StatefulWidget {
  const SubmitComplaint({super.key});

  @override
  State<SubmitComplaint> createState() => _SubmitComplaintState();
}

class _SubmitComplaintState extends State<SubmitComplaint> {
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
                Expanded(
                  child: SingleChildScrollView(
                    child: TextField(
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


                  ),
                ),


              ],
            ),
          )
      )
    );
  }
}
