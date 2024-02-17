import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/navigator/route_name.dart';
class FundWallet extends StatelessWidget {
  const FundWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //const Gap(10),
                    const AppBackButton(),
                    TextSemiBold(
                      'Fund Wallet',
                      fontSize: 20,
                    ),
                    const SizedBox(
                      height: 50,
                      width: 50,
                      child: Text(''),
                    )
                  ],
                ),
                const SizedBox(height: 30,),
                SizedBox(width: 220,
                  child: TextFormField(
                    cursorColor: AppColors.primaryColor,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffEAECF0))
                      ),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.textFieldBackground,
                          )
                      ),
                      prefixStyle: GoogleFonts.roboto(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff101828)
                      ),
                      hintText: "0.00",
                      alignLabelWithHint: true,
                      label: const Center(child: Text("Enter Amount")),
                      labelStyle: const TextStyle(fontSize: 16,color: Color(0xff667085)),
                      hintStyle: const TextStyle(
                          fontSize: 40,
                          color: Color(0xff9E9E9E)
                      ),
                    ),
                    style: GoogleFonts.inter(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff101828)
                    ),
                    controller: TextEditingController(text: '00'),
                  ),),
                const SizedBox(height: 30,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Quick amount selection",style: TextStyle(
                      fontSize: 12,color: Color(0xff344054)
                  ),),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: amounts.sublist(0,4).map((e) {
                    return Material(
                      color: const Color(0xffFDF6F3),
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        child: Text(e,style: GoogleFonts.inter(
                            fontSize: 13,color: const Color(0xff344054)
                        ),),

                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: amounts.sublist(4).map((e) {
                    return Material(
                      color: const Color(0xffFDF6F3),
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                        child: Text(e,style: GoogleFonts.inter(
                            fontSize: 12,color: const Color(0xff344054)
                        ),),

                      ),
                    );
                  }).toList(),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.paymentMethod);
                  },
                  child: Material(
                    elevation: 0,
                    color: const Color(0xffF26520),
                    borderRadius: BorderRadius.circular(40),
                    child: SizedBox(
                      height: 57,
                      width: MediaQuery.sizeOf(context).width,
                      child: const Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}


List<String> amounts = [
  '₦1,000','₦2,000','₦5,000','₦10,000','₦12,000','₦15,000','₦20,000','₦25,0000'
];