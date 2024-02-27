import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class TrackingOverview extends StatefulWidget {
  const TrackingOverview({Key? key}) : super(key: key);

  @override
  State<TrackingOverview> createState() => _TrackingOverviewState();
}

class _TrackingOverviewState extends State<TrackingOverview> {
  int selectedIndex = 0;

  // Define details for each button
  List<List<String>> shipmentDetails = [
    ['Detail 1 for All', 'Detail 2 for All', 'Detail 3 for All'],
    ['Detail 1 for Pending', 'Detail 2 for Pending'],
    ['Detail 1 for On Delivery', 'Detail 2 for On Delivery'],
    ['Detail 1 for Delivered'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: AppBackButton(),
                  ),
                ),
                const SizedBox(width: 60.0),
                //Text at the center Top
                TextSemiBold(
                  "Shipments",
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextField(
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  hintText: 'Enter Tracking ID',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 2,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 2,
                      color: AppColors.textFieldBackground,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  filled: true,
                  fillColor: AppColors.textFieldBackground,
                  suffixIcon: SvgPicture.asset(
                    AppAssets.searchStatus,
                    width: 10,
                    height: 20,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 4; i++)
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = i;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: selectedIndex == i ? AppColors.primaryColor : AppColors.white,
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          ),
                          child: TextSmall(
                            _getButtonName(i),
                            style: TextStyle(
                              fontSize: 11,
                              color: selectedIndex == i ? AppColors.white : AppColors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: shipmentDetails[selectedIndex].length + (selectedIndex == 0 ? 1 : 0), // Add 1 if "All" button is selected
                itemBuilder: (context, index) {
                  if (selectedIndex == 0 && index == 0) {
                    // Render detail 1 for "All" button
                    return Column(
                      children: [
                        // All the details for the "All" button...
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 80,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xffFFF7E4),
                                  child: SvgPicture.asset(AppAssets.tee),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tracking Number',
                                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                                ),
                                const SizedBox(height: 7),
                                // Replace with actual data
                                Text(
                                  '123FYHJD1',
                                  style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    // Replace with actual data
                                    Text(
                                      'Gwarinpa',
                                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(Icons.arrow_forward_rounded, color: Color(0xffF26520)),
                                    const SizedBox(width: 5),
                                    // Replace with actual data
                                    Text(
                                      'Karu',
                                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
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
                                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                                ),
                                const SizedBox(height: 7),
                                const Text(
                                  '19 Nov 2023',
                                  style: TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFECFDF3),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'In Transit',
                                    style: const TextStyle(fontSize: 12, color: Color(0XFF12B76A)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 25),
                            const Icon(Icons.arrow_forward_ios, color: Color(0xff667085)),
                          ],
                        ),
                        const Divider(color: Color(0xffEAECF0)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 80,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xffFFF7E4),
                                  child: SvgPicture.asset(AppAssets.tee),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tracking Number',
                                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                                ),
                                const SizedBox(height: 7),
                                // Replace with actual data
                                Text(
                                  '123FYHJD1',
                                  style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    // Replace with actual data
                                    Text(
                                      'Gwarinpa',
                                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(Icons.arrow_forward_rounded, color: Color(0xffF26520)),
                                    const SizedBox(width: 5),
                                    // Replace with actual data
                                    Text(
                                      'Karu',
                                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
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
                                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                                ),
                                const SizedBox(height: 7),
                                const Text(
                                  '19 Nov 2023',
                                  style: TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFECFDF3),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'In Transit',
                                    style: const TextStyle(fontSize: 12, color: Color(0XFF12B76A)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 25),
                            const Icon(Icons.arrow_forward_ios, color: Color(0xff667085)),
                          ],
                        ),
                        const Divider(color: Color(0xffEAECF0)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 80,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xffFFF7E4),
                                  child: SvgPicture.asset(AppAssets.tee),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tracking Number',
                                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                                ),
                                const SizedBox(height: 7),
                                // Replace with actual data
                                Text(
                                  '123FYHJD1',
                                  style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    // Replace with actual data
                                    Text(
                                      'Gwarinpa',
                                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(Icons.arrow_forward_rounded, color: Color(0xffF26520)),
                                    const SizedBox(width: 5),
                                    // Replace with actual data
                                    Text(
                                      'Karu',
                                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
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
                                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                                ),
                                const SizedBox(height: 7),
                                const Text(
                                  '19 Nov 2023',
                                  style: TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFECFDF3),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'In Transit',
                                    style: const TextStyle(fontSize: 12, color: Color(0XFF12B76A)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 25),
                            const Icon(Icons.arrow_forward_ios, color: Color(0xff667085)),
                          ],
                        ),
                        const Divider(color: Color(0xffEAECF0)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 80,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xffFFF7E4),
                                  child: SvgPicture.asset(AppAssets.tee),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tracking Number',
                                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                                ),
                                const SizedBox(height: 7),
                                // Replace with actual data
                                Text(
                                  '123FYHJD1',
                                  style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    // Replace with actual data
                                    Text(
                                      'Gwarinpa',
                                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(Icons.arrow_forward_rounded, color: Color(0xffF26520)),
                                    const SizedBox(width: 5),
                                    // Replace with actual data
                                    Text(
                                      'Karu',
                                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
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
                                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                                ),
                                const SizedBox(height: 7),
                                const Text(
                                  '19 Nov 2023',
                                  style: TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFECFDF3),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'In Transit',
                                    style: const TextStyle(fontSize: 12, color: Color(0XFF12B76A)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 25),
                            const Icon(Icons.arrow_forward_ios, color: Color(0xff667085)),
                          ],
                        ),
                        const Divider(color: Color(0xffEAECF0)),
                      ],
                    );
                  } else if (selectedIndex == 1) {
                    // Render details for "Pending" button
                    return _buildPendingRow();
                  } else if (selectedIndex == 2) {
                    // Render details for "On Delivery" button
                    return _buildOnDeliveryRow();
                  } else if (selectedIndex == 3 && index == 0) {
                    // Render detail 1 for "Delivered" button
                    return Column(
                      children: [
                        // The row for "Delivered" button...
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 80,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xffFFF7E4),
                                  child: SvgPicture.asset(AppAssets.tee),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tracking Number',
                                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                                ),
                                const SizedBox(height: 7),
                                // Replace with actual data
                                Text(
                                  '123FYHJD1',
                                  style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    // Replace with actual data
                                    Text(
                                      'Gwarinpa',
                                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(Icons.arrow_forward_rounded, color: Color(0xffF26520)),
                                    const SizedBox(width: 5),
                                    // Replace with actual data
                                    Text(
                                      'Karu',
                                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
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
                                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                                ),
                                const SizedBox(height: 7),
                                const Text(
                                  '19 Nov 2023',
                                  style: TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFECFDF3),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'In Transit',
                                    style: const TextStyle(fontSize: 12, color: Color(0XFF12B76A)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 25),
                            const Icon(Icons.arrow_forward_ios, color: Color(0xff667085)),
                          ],
                        ),
                        const Divider(color: Color(0xffEAECF0)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 80,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xffFFF7E4),
                                  child: SvgPicture.asset(AppAssets.tee),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tracking Number',
                                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                                ),
                                const SizedBox(height: 7),
                                // Replace with actual data
                                Text(
                                  '123FYHJD1',
                                  style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    // Replace with actual data
                                    Text(
                                      'Gwarinpa',
                                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(Icons.arrow_forward_rounded, color: Color(0xffF26520)),
                                    const SizedBox(width: 5),
                                    // Replace with actual data
                                    Text(
                                      'Karu',
                                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
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
                                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                                ),
                                const SizedBox(height: 7),
                                const Text(
                                  '19 Nov 2023',
                                  style: TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFECFDF3),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'In Transit',
                                    style: const TextStyle(fontSize: 12, color: Color(0XFF12B76A)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 25),
                            const Icon(Icons.arrow_forward_ios, color: Color(0xff667085)),
                          ],
                        ),
                        const Divider(color: Color(0xffEAECF0)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 80,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xffFFF7E4),
                                  child: SvgPicture.asset(AppAssets.tee),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tracking Number',
                                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                                ),
                                const SizedBox(height: 7),
                                // Replace with actual data
                                Text(
                                  '123FYHJD1',
                                  style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    // Replace with actual data
                                    Text(
                                      'Gwarinpa',
                                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(Icons.arrow_forward_rounded, color: Color(0xffF26520)),
                                    const SizedBox(width: 5),
                                    // Replace with actual data
                                    Text(
                                      'Karu',
                                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
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
                                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                                ),
                                const SizedBox(height: 7),
                                const Text(
                                  '19 Nov 2023',
                                  style: TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFECFDF3),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'In Transit',
                                    style: const TextStyle(fontSize: 12, color: Color(0XFF12B76A)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 25),
                            const Icon(Icons.arrow_forward_ios, color: Color(0xff667085)),
                          ],
                        ),
                        const Divider(color: Color(0xffEAECF0)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 80,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xffFFF7E4),
                                  child: SvgPicture.asset(AppAssets.tee),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tracking Number',
                                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                                ),
                                const SizedBox(height: 7),
                                // Replace with actual data
                                Text(
                                  '123FYHJD1',
                                  style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    // Replace with actual data
                                    Text(
                                      'Gwarinpa',
                                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(Icons.arrow_forward_rounded, color: Color(0xffF26520)),
                                    const SizedBox(width: 5),
                                    // Replace with actual data
                                    Text(
                                      'Karu',
                                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
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
                                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                                ),
                                const SizedBox(height: 7),
                                const Text(
                                  '19 Nov 2023',
                                  style: TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFECFDF3),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'In Transit',
                                    style: const TextStyle(fontSize: 12, color: Color(0XFF12B76A)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 25),
                            const Icon(Icons.arrow_forward_ios, color: Color(0xff667085)),
                          ],
                        ),
                        const Divider(color: Color(0xffEAECF0)),
                      ],
                    );
                  } else {
                    // Render other details based on the selected index
                    return ListTile(
                      title: Text(shipmentDetails[selectedIndex][index - (selectedIndex == 0 ? 1 : 0)]),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPendingRow() {
    // Customize the row for "Pending" button
    return Column(
      children: [
        // The row for "Pending" button...
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: const Color(0xffFFF7E4),
                  child: SvgPicture.asset(AppAssets.tee),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tracking Number',
                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                ),
                const SizedBox(height: 7),
                // Replace with actual data
                Text(
                  '123FYHJD1',
                  style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    // Replace with actual data
                    Text(
                      'Gwarinpa',
                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 5),
                    const Icon(Icons.arrow_forward_rounded, color: Color(0xffF26520)),
                    const SizedBox(width: 5),
                    // Replace with actual data
                    Text(
                      'Karu',
                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
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
                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                ),
                const SizedBox(height: 7),
                const Text(
                  '19 Nov 2023',
                  style: TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0XFFECFDF3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'In Transit',
                    style: const TextStyle(fontSize: 12, color: Color(0XFF12B76A)),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 25),
            const Icon(Icons.arrow_forward_ios, color: Color(0xff667085)),
          ],
        ),
        const Divider(color: Color(0xffEAECF0)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: const Color(0xffFFF7E4),
                  child: SvgPicture.asset(AppAssets.tee),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tracking Number',
                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                ),
                const SizedBox(height: 7),
                // Replace with actual data
                Text(
                  '123FYHJD1',
                  style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    // Replace with actual data
                    Text(
                      'Gwarinpa',
                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 5),
                    const Icon(Icons.arrow_forward_rounded, color: Color(0xffF26520)),
                    const SizedBox(width: 5),
                    // Replace with actual data
                    Text(
                      'Karu',
                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
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
                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                ),
                const SizedBox(height: 7),
                const Text(
                  '19 Nov 2023',
                  style: TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0XFFECFDF3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'In Transit',
                    style: const TextStyle(fontSize: 12, color: Color(0XFF12B76A)),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 25),
            const Icon(Icons.arrow_forward_ios, color: Color(0xff667085)),
          ],
        ),
        const Divider(color: Color(0xffEAECF0)),
      ],
    );
  }

  Widget _buildOnDeliveryRow() {
    // Customize the row for "On Delivery" button
    return Column(
      children: [
        // The row for "On Delivery" button...
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: const Color(0xffFFF7E4),
                  child: SvgPicture.asset(AppAssets.tee),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tracking Number',
                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                ),
                const SizedBox(height: 7),
                // Replace with actual data
                Text(
                  '123FYHJD1',
                  style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    // Replace with actual data
                    Text(
                      'Gwarinpa',
                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 5),
                    const Icon(Icons.arrow_forward_rounded, color: Color(0xffF26520)),
                    const SizedBox(width: 5),
                    // Replace with actual data
                    Text(
                      'Karu',
                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
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
                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                ),
                const SizedBox(height: 7),
                const Text(
                  '19 Nov 2023',
                  style: TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0XFFECFDF3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'In Transit',
                    style: const TextStyle(fontSize: 12, color: Color(0XFF12B76A)),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 25),
            const Icon(Icons.arrow_forward_ios, color: Color(0xff667085)),
          ],
        ),
        const Divider(color: Color(0xffEAECF0)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: const Color(0xffFFF7E4),
                  child: SvgPicture.asset(AppAssets.tee),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tracking Number',
                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                ),
                const SizedBox(height: 7),
                // Replace with actual data
                Text(
                  '123FYHJD1',
                  style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    // Replace with actual data
                    Text(
                      'Gwarinpa',
                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 5),
                    const Icon(Icons.arrow_forward_rounded, color: Color(0xffF26520)),
                    const SizedBox(width: 5),
                    // Replace with actual data
                    Text(
                      'Karu',
                      style: const TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
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
                  style: TextStyle(fontSize: 12, color: Color(0xff344054)),
                ),
                const SizedBox(height: 7),
                const Text(
                  '19 Nov 2023',
                  style: TextStyle(fontSize: 14, color: Color(0xff101828), fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0XFFECFDF3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'In Transit',
                    style: const TextStyle(fontSize: 12, color: Color(0XFF12B76A)),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 25),
            const Icon(Icons.arrow_forward_ios, color: Color(0xff667085)),
          ],
        ),
        const Divider(color: Color(0xffEAECF0)),
      ],
    );
  }

  String _getButtonName(int index) {
    switch (index) {
      case 0:
        return 'All';
      case 1:
        return 'Pending';
      case 2:
        return 'On Delivery';
      case 3:
        return 'Delivered';
      default:
        return '';
    }
  }
}
