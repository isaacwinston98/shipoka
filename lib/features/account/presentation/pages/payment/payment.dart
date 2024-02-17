import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/navigator/route_name.dart';


class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //const Gap(10),
                  const AppBackButton(),
                  TextSemiBold(
                    'Payment',
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 50,
                    width: 50,
                    child: Text(''),
                  )
                ],
              ),
              const Gap(25),
              Material(
                elevation: 0,
                color: const Color(0xffF26520),
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Shipoka balance",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                                text: '₦',
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                                children: [
                                  TextSpan(
                                      text: "2,430.00",
                                      style: GoogleFonts.dmSans(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white))
                                ]),
                          ),
                          const Spacer(),
                          Material(
                            borderRadius: BorderRadius.circular(40),
                            color: const Color(0xff101828),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 7),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {

                                    },
                                    child: const Text(
                                      "Fund wallet",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Colors.white,
                            size: 18,
                          ),
                          Text(
                            "What is Shipoka Wallet balance?",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.currency);
                },
                child: Material(
                  color: const Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Row(
                      children: [
                        TextBody(
                          "Currency Preference",
                          fontWeight: FontWeight.w400,
                        ),
                        const Spacer(),
                        TextBody(
                          "NGN",
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xff344054),
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Color(0xff344054),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}