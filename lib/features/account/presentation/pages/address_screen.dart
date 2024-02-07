import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class UserAccountAdresssScreen extends StatefulWidget {
  const UserAccountAdresssScreen({Key? key}) : super(key: key);

  @override
  State<UserAccountAdresssScreen> createState() => _UserAccountAdresssScreenState();
}

class _UserAccountAdresssScreenState extends State<UserAccountAdresssScreen> {
  late List<Widget>? _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      _buildTab("All"),
      _buildTab("Sender"),
      _buildTab("Receiver"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppBackButton(),
                TextSemiBold(
                  'Shipments',
                  fontSize: 20,
                ),
                const SizedBox(
                  height: 50,
                  width: 50,
                  child: Text(''),
                ),
              ],
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextField(
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  hintText: 'Search Saved Address',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 2, // Increased border width
                      color: AppColors.primaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(width: 2, color: AppColors.textFieldBackground), // Increased border width
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),

                    borderSide: const BorderSide(
                      color: AppColors.primaryColor, // Set your desired border color here
                    ),
                  ),
                  filled: true,
                  fillColor: AppColors.textFieldBackground, // Set your desired background color here
                  suffixIcon: SvgPicture.asset(
                    AppAssets.searchStatus,
                    width: 10,
                    height: 20,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            const Gap(10),
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primaryColor,
                      ),
                      tabs: _tabs!, // Use _tabs here
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Content of Tab 1
                          Center(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).padding.top - // Consider the top padding
                                  kToolbarHeight - // Consider the height of the AppBar
                                  kBottomNavigationBarHeight - // Consider the height of the bottom navigation bar (if present)
                                  16 * 6 - // Sum of all vertical paddings and gaps (16 * 6)
                                  50, // Height of the "Add New Address" button
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20), // Add vertical spacing here
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Your content here
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 10.0),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/location.svg', // Provide your asset path here
                                                width: 24, // Adjust width as needed
                                                height: 24, // Adjust height as needed
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSemiBold("Dami Kent"),
                                              TextSmall("23 Chicago Street, Abuja"),
                                            ],
                                          ),
                                          Spacer(), // Add a spacer to push the next widget to the right
                                          GestureDetector(
                                            onTap: () {
                                  // Handle Tap on the Icon
                                            },
                                            child: Row(
                                              children: [
                                                TextSmall(
                                                  "Edit",
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                                SizedBox(width: 5),
                                                SvgPicture.asset(
                                                  'assets/icons/trash.svg', // Provide your asset path here
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 10.0),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/location.svg', // Provide your asset path here
                                                width: 24, // Adjust width as needed
                                                height: 24, // Adjust height as needed
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSemiBold("Dami Kent"),
                                              TextSmall("23 Chicago Street, Abuja"),
                                            ],
                                          ),
                                          Spacer(), // Add a spacer to push the next widget to the right
                                          GestureDetector(
                                            onTap: () {
                                  // Handle Tap on the Icon
                                            },
                                            child: Row(
                                              children: [
                                                TextSmall(
                                                  "Edit",
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                                SizedBox(width: 5),
                                                SvgPicture.asset(
                                                  'assets/icons/trash.svg', // Provide your asset path here
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 10.0),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/location.svg', // Provide your asset path here
                                                width: 24, // Adjust width as needed
                                                height: 24, // Adjust height as needed
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSemiBold("Dami Kent"),
                                              TextSmall("23 Chicago Street, Abuja"),
                                            ],
                                          ),
                                          Spacer(), // Add a spacer to push the next widget to the right
                                          GestureDetector(
                                            onTap: () {
                                  // Handle Tap on the Icon
                                            },
                                            child: Row(
                                              children: [
                                                TextSmall(
                                                  "Edit",
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                                SizedBox(width: 5),
                                                SvgPicture.asset(
                                                  'assets/icons/trash.svg', // Provide your asset path here
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 10.0),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/location.svg', // Provide your asset path here
                                                width: 24, // Adjust width as needed
                                                height: 24, // Adjust height as needed
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSemiBold("Dami Kent"),
                                              TextSmall("23 Chicago Street, Abuja"),
                                            ],
                                          ),
                                          Spacer(), // Add a spacer to push the next widget to the right
                                          GestureDetector(
                                            onTap: () {
                                  // Handle Tap on the Icon
                                            },
                                            child: Row(
                                              children: [
                                                TextSmall(
                                                  "Edit",
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                                SizedBox(width: 5),
                                                SvgPicture.asset(
                                                  'assets/icons/trash.svg', // Provide your asset path here
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 10.0),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/location.svg', // Provide your asset path here
                                                width: 24, // Adjust width as needed
                                                height: 24, // Adjust height as needed
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSemiBold("Dami Kent"),
                                              TextSmall("23 Chicago Street, Abuja"),
                                            ],
                                          ),
                                          Spacer(), // Add a spacer to push the next widget to the right
                                          GestureDetector(
                                            onTap: () {
                                              // Handle Tap on the Icon
                                            },
                                            child: Row(
                                              children: [
                                                TextSmall(
                                                  "Edit",
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                                SizedBox(width: 5),
                                                SvgPicture.asset(
                                                  'assets/icons/trash.svg', // Provide your asset path here
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 10.0),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/location.svg', // Provide your asset path here
                                                width: 24, // Adjust width as needed
                                                height: 24, // Adjust height as needed
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSemiBold("Dami Kent"),
                                              TextSmall("23 Chicago Street, Abuja"),
                                            ],
                                          ),
                                          Spacer(), // Add a spacer to push the next widget to the right
                                          GestureDetector(
                                            onTap: () {
                                              // Handle Tap on the Icon
                                            },
                                            child: Row(
                                              children: [
                                                TextSmall(
                                                  "Edit",
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                                SizedBox(width: 5),
                                                SvgPicture.asset(
                                                  'assets/icons/trash.svg', // Provide your asset path here
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Content of Tab 2
                          Center(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).padding.top - // Consider the top padding
                                  kToolbarHeight - // Consider the height of the AppBar
                                  kBottomNavigationBarHeight - // Consider the height of the bottom navigation bar (if present)
                                  16 * 6 - // Sum of all vertical paddings and gaps (16 * 6)
                                  50, // Height of the "Add New Address" button
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20), // Add vertical spacing here
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Your content here
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 10.0),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/location.svg', // Provide your asset path here
                                                width: 24, // Adjust width as needed
                                                height: 24, // Adjust height as needed
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSemiBold("Dami Kent"),
                                              TextSmall("23 Chicago Street, Abuja"),
                                            ],
                                          ),
                                          Spacer(), // Add a spacer to push the next widget to the right
                                          GestureDetector(
                                            onTap: () {
                                              // Handle Tap on the Icon
                                            },
                                            child: Row(
                                              children: [
                                                TextSmall(
                                                  "Edit",
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                                SizedBox(width: 5),
                                                SvgPicture.asset(
                                                  'assets/icons/trash.svg', // Provide your asset path here
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 10.0),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/location.svg', // Provide your asset path here
                                                width: 24, // Adjust width as needed
                                                height: 24, // Adjust height as needed
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSemiBold("Dami Kent"),
                                              TextSmall("23 Chicago Street, Abuja"),
                                            ],
                                          ),
                                          Spacer(), // Add a spacer to push the next widget to the right
                                          GestureDetector(
                                            onTap: () {
                                              // Handle Tap on the Icon
                                            },
                                            child: Row(
                                              children: [
                                                TextSmall(
                                                  "Edit",
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                                SizedBox(width: 5),
                                                SvgPicture.asset(
                                                  'assets/icons/trash.svg', // Provide your asset path here
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 10.0),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/location.svg', // Provide your asset path here
                                                width: 24, // Adjust width as needed
                                                height: 24, // Adjust height as needed
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSemiBold("Dami Kent"),
                                              TextSmall("23 Chicago Street, Abuja"),
                                            ],
                                          ),
                                          Spacer(), // Add a spacer to push the next widget to the right
                                          GestureDetector(
                                            onTap: () {
                                              // Handle Tap on the Icon
                                            },
                                            child: Row(
                                              children: [
                                                TextSmall(
                                                  "Edit",
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                                SizedBox(width: 5),
                                                SvgPicture.asset(
                                                  'assets/icons/trash.svg', // Provide your asset path here
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 10.0),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/location.svg', // Provide your asset path here
                                                width: 24, // Adjust width as needed
                                                height: 24, // Adjust height as needed
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSemiBold("Dami Kent"),
                                              TextSmall("23 Chicago Street, Abuja"),
                                            ],
                                          ),
                                          Spacer(), // Add a spacer to push the next widget to the right
                                          GestureDetector(
                                            onTap: () {
                                              // Handle Tap on the Icon
                                            },
                                            child: Row(
                                              children: [
                                                TextSmall(
                                                  "Edit",
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                                SizedBox(width: 5),
                                                SvgPicture.asset(
                                                  'assets/icons/trash.svg', // Provide your asset path here
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 10.0),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/location.svg', // Provide your asset path here
                                                width: 24, // Adjust width as needed
                                                height: 24, // Adjust height as needed
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSemiBold("Dami Kent"),
                                              TextSmall("23 Chicago Street, Abuja"),
                                            ],
                                          ),
                                          Spacer(), // Add a spacer to push the next widget to the right
                                          GestureDetector(
                                            onTap: () {
                                              // Handle Tap on the Icon
                                            },
                                            child: Row(
                                              children: [
                                                TextSmall(
                                                  "Edit",
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                                SizedBox(width: 5),
                                                SvgPicture.asset(
                                                  'assets/icons/trash.svg', // Provide your asset path here
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 10.0),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/location.svg', // Provide your asset path here
                                                width: 24, // Adjust width as needed
                                                height: 24, // Adjust height as needed
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSemiBold("Dami Kent"),
                                              TextSmall("23 Chicago Street, Abuja"),
                                            ],
                                          ),
                                          Spacer(), // Add a spacer to push the next widget to the right
                                          GestureDetector(
                                            onTap: () {
                                              // Handle Tap on the Icon
                                            },
                                            child: Row(
                                              children: [
                                                TextSmall(
                                                  "Edit",
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                                SizedBox(width: 5),
                                                SvgPicture.asset(
                                                  'assets/icons/trash.svg', // Provide your asset path here
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Content of Tab 3
                          Center(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).padding.top - // Consider the top padding
                                  kToolbarHeight - // Consider the height of the AppBar
                                  kBottomNavigationBarHeight - // Consider the height of the bottom navigation bar (if present)
                                  16 * 6 - // Sum of all vertical paddings and gaps (16 * 6)
                                  50, // Height of the "Add New Address" button
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20), // Add vertical spacing here
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Your content here
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 10.0),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/location.svg', // Provide your asset path here
                                                width: 24, // Adjust width as needed
                                                height: 24, // Adjust height as needed
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSemiBold("Dami Kent"),
                                              TextSmall("23 Chicago Street, Abuja"),
                                            ],
                                          ),
                                          Spacer(), // Add a spacer to push the next widget to the right
                                          GestureDetector(
                                            onTap: () {
                                              // Handle Tap on the Icon
                                            },
                                            child: Row(
                                              children: [
                                                TextSmall(
                                                  "Edit",
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                                SizedBox(width: 5),
                                                SvgPicture.asset(
                                                  'assets/icons/trash.svg', // Provide your asset path here
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 10.0),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/location.svg', // Provide your asset path here
                                                width: 24, // Adjust width as needed
                                                height: 24, // Adjust height as needed
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSemiBold("Dami Kent"),
                                              TextSmall("23 Chicago Street, Abuja"),
                                            ],
                                          ),
                                          Spacer(), // Add a spacer to push the next widget to the right
                                          GestureDetector(
                                            onTap: () {
                                              // Handle Tap on the Icon
                                            },
                                            child: Row(
                                              children: [
                                                TextSmall(
                                                  "Edit",
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                                SizedBox(width: 5),
                                                SvgPicture.asset(
                                                  'assets/icons/trash.svg', // Provide your asset path here
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 10.0),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/location.svg', // Provide your asset path here
                                                width: 24, // Adjust width as needed
                                                height: 24, // Adjust height as needed
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSemiBold("Dami Kent"),
                                              TextSmall("23 Chicago Street, Abuja"),
                                            ],
                                          ),
                                          Spacer(), // Add a spacer to push the next widget to the right
                                          GestureDetector(
                                            onTap: () {
                                              // Handle Tap on the Icon
                                            },
                                            child: Row(
                                              children: [
                                                TextSmall(
                                                  "Edit",
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                                SizedBox(width: 5),
                                                SvgPicture.asset(
                                                  'assets/icons/trash.svg', // Provide your asset path here
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 10.0),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/location.svg', // Provide your asset path here
                                                width: 24, // Adjust width as needed
                                                height: 24, // Adjust height as needed
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSemiBold("Dami Kent"),
                                              TextSmall("23 Chicago Street, Abuja"),
                                            ],
                                          ),
                                          Spacer(), // Add a spacer to push the next widget to the right
                                          GestureDetector(
                                            onTap: () {
                                              // Handle Tap on the Icon
                                            },
                                            child: Row(
                                              children: [
                                                TextSmall(
                                                  "Edit",
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                                SizedBox(width: 5),
                                                SvgPicture.asset(
                                                  'assets/icons/trash.svg', // Provide your asset path here
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 10.0),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/location.svg', // Provide your asset path here
                                                width: 24, // Adjust width as needed
                                                height: 24, // Adjust height as needed
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSemiBold("Dami Kent"),
                                              TextSmall("23 Chicago Street, Abuja"),
                                            ],
                                          ),
                                          Spacer(), // Add a spacer to push the next widget to the right
                                          GestureDetector(
                                            onTap: () {
                                              // Handle Tap on the Icon
                                            },
                                            child: Row(
                                              children: [
                                                TextSmall(
                                                  "Edit",
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                                SizedBox(width: 5),
                                                SvgPicture.asset(
                                                  'assets/icons/trash.svg', // Provide your asset path here
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 10.0),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/location.svg', // Provide your asset path here
                                                width: 24, // Adjust width as needed
                                                height: 24, // Adjust height as needed
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextSemiBold("Dami Kent"),
                                              TextSmall("23 Chicago Street, Abuja"),
                                            ],
                                          ),
                                          Spacer(), // Add a spacer to push the next widget to the right
                                          GestureDetector(
                                            onTap: () {
                                              // Handle Tap on the Icon
                                            },
                                            child: Row(
                                              children: [
                                                TextSmall(
                                                  "Edit",
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                                SizedBox(width: 5),
                                                SvgPicture.asset(
                                                  'assets/icons/trash.svg', // Provide your asset path here
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BusyButton(
              title: 'Add New Address',
              onTap: () {
                Navigator.pushNamed(context, RouteName.addNewAddress);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text) {
    return Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Adjusted padding
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), // Adjusted border radius
          border: Border.all(color: AppColors.primaryColor, width: 1), // Adjusted border width
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
