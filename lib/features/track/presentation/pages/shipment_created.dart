import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class ShipmentCreated extends StatelessWidget {
  const ShipmentCreated({super.key});

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
                        height: MediaQuery.sizeOf(context).height * 0.25,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(AppAssets.vector,height: 40,),),
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
                              const Row(
                                children: [
                                  Text("Shipment Specifications",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff101828),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'ID:A1W2333',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff344054),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5,),
                              const Text(
                                'Waiting to be assigned to Driver....',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff344054),
                                ),
                              ),
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
                                                    color: const Color(0xffFBEAE1),
                                                    borderRadius: BorderRadius.circular(30)
                                                ),
                                                child: const Text("Shipment Created",
                                                  style: TextStyle(
                                                      fontSize: 12,color: Color(0xffF26520)
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

class DeliveryLocation extends StatelessWidget {
  const DeliveryLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
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
                            color: const Color(0xffF2F4F7),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: const Text("Pending",
                          style: TextStyle(
                              fontSize: 12,color: Color(0xff101828)
                          ),
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset('assets/svgs/edit.svg')
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
    );
  }
}
