import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  late List<Widget>? _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      _buildTab("General"),
      _buildTab("Account"),
      _buildTab("Service"),
      _buildTab("Payment"),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const AppBackButton(),
                  const Gap(100),
                  TextSemiBold(
                    'FAQ',
                    fontSize: 20,
                  ),
                ],
              ),
              const Gap(30),
              Expanded(
                  child: DefaultTabController(
                    length: 4,
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
                        const Gap(15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: TextField(
                            cursorColor: AppColors.primaryColor,
                            decoration: InputDecoration(
                              hintText: 'Search',
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
                                              // Your content 1 here
                                              ClickableRow(),
                                              const Gap(30),
                                              ClickableRow(),
                                              const Gap(30),
                                              ClickableRow(),
                                              const Gap(30),
                                              ClickableRow(),
                                              const Gap(30),
                                              ClickableRow(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
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
                                              // Your content 1 here
                                              ClickableRow(),
                                              const Gap(30),
                                              ClickableRow(),
                                              const Gap(30),
                                              ClickableRow(),
                                              const Gap(30),
                                              ClickableRow(),
                                              const Gap(30),
                                              ClickableRow(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
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
                                              // Your content 1 here
                                              ClickableRow(),
                                              const Gap(30),
                                              ClickableRow(),
                                              const Gap(30),
                                              ClickableRow(),
                                              const Gap(30),
                                              ClickableRow(),
                                              const Gap(30),
                                              ClickableRow(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
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
                                              // Your content 1 here
                                              ClickableRow(),
                                              const Gap(30),
                                              ClickableRow(),
                                              const Gap(30),
                                              ClickableRow(),
                                              const Gap(30),
                                              ClickableRow(),
                                              const Gap(30),
                                              ClickableRow(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                ]
                            )
                        )
                      ],
                    ),
                  )
              )
            ],
          ),
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


class ClickableRow extends StatefulWidget {
  @override
  _ClickableRowState createState() => _ClickableRowState();
}

class _ClickableRowState extends State<ClickableRow> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Adjust border radius
          color: AppColors.lightGrey3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextSemiBold(
                    'What is Shipoka',
                    style: TextStyle(fontSize: 15),
                  ),
                  SvgPicture.asset(AppAssets.dropDown),
                ],
              ),
            ),
            Container(
              height: _isExpanded ? 100 : 0, // Adjust the expanded height
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.lightGrey), // Add horizontal line separator
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fermentum felis a justo dignissim volutpat. Cras rutrum sollicitudin justo, nec sollicitudin libero vulputate ac. Integer euismod euismod libero, eget posuere libero malesuada vel. Nam id risus id metus scelerisque venenatis. Sed sed orci nisl. Fusce non ex ut sem ultricies accumsan. Vivamus in turpis et odio tristique rutrum eget eget leo. Sed congue arcu at scelerisque sagittis. Vestibulum sed massa tortor. Vestibulum vel vestibulum mauris. Donec non felis metus.',
                    softWrap: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
