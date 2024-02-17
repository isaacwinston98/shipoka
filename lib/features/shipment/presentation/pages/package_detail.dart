import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/core/navigator/route_name.dart';
import 'package:shipoka/features/shipment/presentation/changeNotifier/shipment_notifier.dart';
import 'package:shipoka/features/shipment/presentation/widgets/item_detail.dart';
import 'package:shipoka/features/shipment/presentation/widgets/package_details.dart';
import 'package:shipoka/features/shipment/presentation/widgets/package_details_entry.dart';


class PackageDetail extends StatefulWidget {
  const PackageDetail({super.key});

  @override
  State<PackageDetail> createState() => _PackageDetailState();
}

class _PackageDetailState extends State<PackageDetail> {
  bool clicked  = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textFieldBackground,
      body: SafeArea(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                color: AppColors.white,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            const Gap(10),
                            Row(
                              children: [
                                const AppBackButton(),
                                const Gap(20),
                                TextSemiBold(
                                  'Package Details',
                                  fontSize: 20,
                                ),
                              ],
                            ),
                            const Gap(20),
                            TextBody(
                                'Please share information about your outgoing package',
                              fontWeight: FontWeight.w500,
                              color: AppColors.smallTextColor,
                            ),
                            const Gap(20),
                            const Divider(
                              height: 1,
                              color: AppColors.dividerGrey,
                            ),
                            const Gap(10),

                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.white,
                        ),
                        child:   const SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Gap(10),
                                PackageDetailsEntry(),
                                Gap(20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: BusyButton(
                title: 'Continue',
                onTap: () {
                  Navigator.pushNamed(context, RouteName.multiPackageDetails);
                },
                disabled: false,
              ),
            ),

          ],
        ), ),
    );
  }
}



// class PackageDetail extends StatelessWidget {
//   const PackageDetail({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final shipmentProvider = Provider.of<ShipmentProvider>(context);
//     return Scaffold(
//       backgroundColor: const Color(0xffF9FAFB),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: const Padding(
//           padding: EdgeInsets.only(left: 15.0),
//           child: AppBackButton(),
//         ),
//         centerTitle: true,
//         title: const Text(
//           "Package Details",
//           style: TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.w500,
//             color: Color(0xff101828),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(15),
//         child: SizedBox(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Please share information about your outgoing package",
//                 style: TextStyle(fontSize: 16, color: Color(0xff344054)),
//               ),
//               const SizedBox(height: 20),
//               const Divider(),
//               const SizedBox(
//                 height: 20,
//               ),
//               ListView.separated(
//                 itemBuilder: (context, index) {
//                   return PackageDetails(
//                     index: index,
//                     package: shipmentProvider.pacakages[index],
//                   );
//                 },
//                 separatorBuilder: (_, __) {
//                   return const SizedBox(
//                     height: 15,
//                   );
//                 },
//                 itemCount: shipmentProvider.pacakages.length,
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//               ),
//               const SizedBox(height: 15,),
//               shipmentProvider.canAddPackage
//                   ?Align(
//                 alignment: Alignment.centerLeft,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     const Icon(Icons.add_circle,color: Color(0xff344054),size: 18,),
//                     const SizedBox(width: 10,),
//                     GestureDetector(
//                       onTap: (){
//                         shipmentProvider.addNewPackage();
//                       },
//                       child: const Text("Add new package",style: TextStyle(
//                           fontSize: 14,color: Color(0xffF26520)
//                       ),),
//                     )
//                   ],
//                 ),
//               )
//                   :const SizedBox.shrink(),
//               const SizedBox(height: 50,),
//               GestureDetector(
//                 onTap: () async {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const PackageDetail(),
//                     ),
//                   );
//                 },
//                 child: Material(
//                   elevation: 0,
//                   color: const Color(0xffF26520),
//                   borderRadius: BorderRadius.circular(40),
//                   child: SizedBox(
//                     height: 57,
//                     width: MediaQuery.sizeOf(context).width,
//                     child: const Center(
//                       child: Text(
//                         "Continue",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }