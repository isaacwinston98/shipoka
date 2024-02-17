import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class FundPayment extends StatefulWidget {
  const FundPayment({super.key});

  @override
  State<FundPayment> createState() => _FundPaymentState();
}

class _FundPaymentState extends State<FundPayment> {
  int? typeOfTrip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Gap(20),
              TextBody(
                "Select the top up method you want to use",
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Material(
                      elevation: 0,
                      color: const Color(0xffF7F7F7),
                      borderRadius: BorderRadius.circular(24),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                AppAssets.masterCard,
                              width: 35,
                              height: 35,
                              fit: BoxFit.scaleDown,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "27872******* 6722",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff101828),
                                  ),
                                ),
                                Text(
                                  "Mastercard",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff344054),
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
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
            
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff344054),
                    radius: 10,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Add new card",
                    style: TextStyle(color: Color(0xffF26520), fontSize: 14),
                  )
                ],
              ),
              const Spacer(),
            
              /// Replace with button widget
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.shipokaPin);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}