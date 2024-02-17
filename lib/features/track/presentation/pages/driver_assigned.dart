import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/features/track/presentation/pages/shipment_created.dart';
class DriverAssigned extends StatelessWidget {
  const DriverAssigned({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                   AppAssets.map,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xffFBEAE1),
                        child: Icon(Iconsax.arrow_left,
                          color: Color(0XFF080B30),),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(AppAssets.groups),),
                      ),Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(AppAssets.vector),),
                      ),
                      Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        child: Padding(padding: const EdgeInsets.symmetric(
                            horizontal: 15,vertical: 25
                        ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Row(
                                children: [
                                 const CircleAvatar(
                                   backgroundImage: AssetImage(AppAssets.rectangle),
                                 ),
                                  const SizedBox(width:  10,),
                                  const Expanded(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Driver Name',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xff3101828),
                                              ),
                                            ),
                                            Text(
                                              'Vehicle Type',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff344054),
                                              ),
                                            ),

                                          ],
                                        ),
                                        SizedBox(width:  10,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.star_rounded,color: Color(0xffFDB022),),
                                                Text(
                                                  '5.0',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff344054),
                                                  ),
                                                ),
                                              ],
                                            ),

                                            Text(
                                              'ABC 737 MK',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff344054),
                                              ),
                                            ),
                                          ],
                                        ),


                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 20,),
                                  CircleAvatar(
                                    backgroundColor: const Color(0xff101828),
                                    child: SvgPicture.asset(AppAssets.messageText),
                                  )

                                ],
                              ),
                              const SizedBox(height: 5,),

                              const SizedBox(height: 10,),
                              const Divider(),
                              const SizedBox(height: 30,),
                              const Text(
                                'Delivery Status',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff101828),
                                ),
                              ),
                              const SizedBox(height: 20,),
                              const Text(
                                'Pickup Location',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff344054),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Material(
                                color: const Color(0xffFAFAFA),
                                borderRadius: BorderRadius.circular(20),
                                child: Padding(padding: const EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      const Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Color(0xff344054),
                                            radius: 10,
                                          ),
                                          SizedBox(
                                            height: 50,
                                            child: VerticalDivider(
                                              color: Color(0xff344054),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(width: 15,),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                                  decoration: BoxDecoration(
                                                      color: const Color(0xffEFF8FF),
                                                      borderRadius: BorderRadius.circular(30)
                                                  ),
                                                  child: const Text("Shipment Created",
                                                    style: TextStyle(
                                                        fontSize: 12,color: Color(0xff175CD3)
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5,),
                                            const Text(
                                              '23 Chicago street, Gwarinpa, Abuja',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff101828),
                                              ),
                                            ),
                                            const SizedBox(height: 5,),

                                            const Text(
                                              '17 Oct 2023',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff344054),
                                              ),
                                            ),

                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,),
                              const Text(
                                'Delivery Location',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff344054),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              const DeliveryLocation(),
                              const SizedBox(height: 10,),
                              const DeliveryLocation(),
                              const SizedBox(height: 10,),
                              const DeliveryLocation(),
                              const SizedBox(height: 30,),
                              Container(
                                height: 57,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFFF8F6),
                                    borderRadius: BorderRadius.circular(40)
                                ),
                                child: const Center(
                                  child: Text(
                                    'Cancel Delivery',
                                    style: TextStyle(
                                        fontSize: 16,color: Color(0xffDB1F35)
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),

                        ),
                      )

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}
