import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';
import 'package:shipoka/features/track/presentation/pages/driver_assigned.dart';
import 'package:shipoka/features/track/presentation/pages/shipment_created.dart';


class TrackingOverViewDetail extends StatelessWidget {
  const TrackingOverViewDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.minuteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric( vertical: 20),
          child: Column(
            children: [
               Gap(MediaQuery.of(context).size.height * 0.06),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //const Gap(10),
                  const AppBackButton(),
                  TextSemiBold(
                    'XAETLE34',
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 50,
                    width: 50,
                    child: Text(''),
                  )
                ],
              ),
              const Gap(20),
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.056, vertical: 20),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DetailText(
                            label: "Date Created",
                            text: 'Monday, 17 Oct. 2023',
                          ),
                          DetailText(
                            label: "Sender",
                            text: 'GIFT JONAS',
                          ),
                          SizedBox(),
                        ],
                      ),
                      const Gap(20),
                      const DetailText(
                          label: "Pickup Location",
                          text: "40 Kwari street, Karu, Abuja, Nigeria 90001"),
                      const Gap(25),
                      TextBody(
                        "Shipment Specifications",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xff101828),
                        ),
                      ),
                      const Gap(5),
                      const Divider(
                        height: 1,
                        color: AppColors.dividerGrey,
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextSmall(
                                    'Delivery Type',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      // color: Color(0xff344054),
                                    ),
                                  ),
                                  const Gap(5),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.scaffoldBackground,
                                      borderRadius: BorderRadius.circular(15),
                                    ),

                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: TextSmall(
                                        'Express',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextSmall(
                                    'Trip type',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      // color: Color(0xff344054),
                                    ),
                                  ),
                                  const Gap(5),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.scaffoldBackground,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: TextSmall(
                                        'One way',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextSmall(
                                    'Shipment Location',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      // color: Color(0xff344054),
                                    ),
                                  ),
                                  const Gap(5),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.scaffoldBackground,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: TextSmall(
                                        'Intra City',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextSmall(
                                    'Pickup type',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      // color: Color(0xff344054),
                                    ),
                                  ),
                                  const Gap(5),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.scaffoldBackground,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: TextSmall(
                                        'Instant',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextSmall(
                                'Destination Preference',
                                style: const TextStyle(
                                  fontSize: 12,
                                  // color: Color(0xff344054),
                                ),
                              ),
                              const Gap(5),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.scaffoldBackground,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextSmall(
                                    'Multiple Destination',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      const Gap(20),
                      TextBody(
                        "Delivery Destination",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Gap(5),
                      const Divider(
                        height: 1,
                        color: AppColors.dividerGrey,
                      ),
                      const Gap(15),
                      const DeliveryDestination(),
                      const DeliveryDestination(),
                      const DeliveryDestination(),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(
                20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DriverAssigned(),
                              ),
                            );
                          },
                          child: Container(
                            height: 57,
                            decoration: BoxDecoration(
                                color: AppColors.buttonPink,
                                borderRadius: BorderRadius.circular(40)),
                            child: Center(
                              child: TextBody(
                                "Print Label",
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        )),
                    const Gap(
                      20,
                    ),
                    Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ShipmentCreated(),
                              ),
                            );
                          },
                          child: Container(
                            height: 57,
                            decoration: BoxDecoration(
                                color:AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(40)),
                            child: Center(
                              child: TextBody(
                                "Live Tracking",
                                color: AppColors.white,

                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryDestination extends StatelessWidget {
  const DeliveryDestination({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, RouteName.viewPackage);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DetailText(label: "Shipping to", text: "Joseph Jones"),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                    color: const Color(0xffECFDF3),
                    borderRadius: BorderRadius.circular(30)),
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: Color(0xff027A48),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Paid",
                      style: TextStyle(fontSize: 12, color: Color(0xff027A48)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextSmall(
                '23 Chicago street, Gwarinpa, Abuja',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                ),
              ),
              Row(
                children: [
                  TextBody(
                    'View Package',
                    color: AppColors.primaryColor,
                    fontSize: MediaQuery.of(context).size.width * 0.037,
                  ),
                  SvgPicture.asset(AppAssets.forwardRight)
                ],
              ),

            ],
          ),
          const Gap(
             10,
          ),
          const Divider(
            height: 1,
            color: AppColors.greyBorderColor,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class DetailText extends StatelessWidget {
  final String label;
  final String text;

  const DetailText({
    super.key,
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextSmall(
          label,
          style: const TextStyle(
            fontSize: 12,
           // color: Color(0xff344054),
          ),
        ),
        const Gap(5),
        TextSmall(
          text,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}