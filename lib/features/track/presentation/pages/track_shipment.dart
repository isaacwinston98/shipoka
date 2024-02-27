import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class TrackShipment extends StatefulWidget {
  const TrackShipment({super.key});

  @override
  State<TrackShipment> createState() => _TrackShipmentState();
}

class _TrackShipmentState extends State<TrackShipment> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  int selectedTabIndex = 0;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppBackButton(),
                    TextSemiBold(
                      'Shipment',
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
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    constraints: const BoxConstraints(maxHeight: 57),
                    filled: true,
                    fillColor: const Color(0XFFFAFAFA),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color(0xffF26520),
                      ),
                    ),
                    hintText: "Enter tracking ID",
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF9E9E9E),
                    ),
                    suffixIcon: SvgPicture.asset(
                      AppAssets.search,
                      width:40,
                      height: 40,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Gap(10),
                Container(
                  height: 40,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTabIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: selectedTabIndex == index
                                  ? Colors.orange
                                  : AppColors.dividerGrey,
                              width: 1,
                            ),
                            color: selectedTabIndex == index ? AppColors.primaryColor : null,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            child: Center(
                              child: TextSmall(
                                index == 0 ? 'All' : index == 1 ? 'Pending' : index == 2 ? 'On Delivery' : 'Delivered',
                                color: selectedTabIndex == index ? Colors.white : null,
                              ),
                            ),
                          ),
                        ),
                      );

                    },

                  ),
                ),
                Gap(20),
                ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RouteName.trackOverView);
                      },
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:80,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: CircleAvatar(
                                    backgroundColor: const Color(0xffFFF7E4),
                                    child:
                                    SvgPicture.asset(AppAssets.tee),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Tracking Number',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff344054)),
                                  ),
                                  const SizedBox(height: 7,),
                                  Text(
                                    shipments[index].id,
                                    style: const TextStyle(
                                        fontSize: 14, color: Color(0xff101828),fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Text(
                                        shipments[index].source,
                                        style: const TextStyle(
                                            fontSize: 14, color: Color(0xff101828),fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(width: 5,),
                                      const Icon(Icons.arrow_forward_rounded,color: Color(0xffF26520),),
                                      const SizedBox(width: 5,),
                                      Text(
                                        shipments[index].destination,
                                        style: const TextStyle(
                                            fontSize: 14, color: Color(0xff101828),fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Pickup Date',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff344054)),
                                  ),
                                  const SizedBox(height: 7,),
                                  const Text(
                                    '19 Nov 2023',
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xff101828),fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 15,),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                    decoration: BoxDecoration(
                                        color: shipments[index].delivered?
                                        const Color(0XFFECFDF3):const Color(0XFFEFF8FF),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Text(
                                      shipments[index].delivered? 'In Transit':'Delivered',
                                      style: TextStyle(
                                        fontSize: 12,color: shipments[index].delivered?
                                      const Color(0XFF12B76A):const Color(0XFF175CD3),
                                      ),
                                    ),

                                  )
                                ],
                              ),
                              const SizedBox(width: 25,),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff667085),
                              )

                            ],
                          ),
                          const Divider(color: Color(0xffEAECF0),)
                        ],
                      ),
                    );
                  },

                  separatorBuilder: (_, __) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: shipments.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> filters = ['All', 'Pending', 'On Delivery', 'Delivered'];

class Shipment {
  final String id;
  final String source;
  final String destination;
  final bool delivered;

  Shipment( {required this.id, required this.source, required this.destination,required this.delivered,});
}

List<Shipment> shipments = [
  Shipment(id: '123FYHJD1', source: 'Gwarimpa', destination: 'Karu',delivered: false),
  Shipment(id: '144GTUJ2', source: 'Abuja', destination: 'Lagos',delivered: false),
  Shipment(id: '564VYHJR3', source: 'Asokoro', destination: 'Mpape',delivered: false),
  Shipment(id: '123FYHJD1', source: 'Gwarimpa', destination: 'Karu',delivered: false),
  Shipment(id: '144GTUJ2', source: 'Abuja', destination: 'Lagos',delivered: true),

];