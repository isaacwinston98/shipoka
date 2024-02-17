import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:expandable/expandable.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: TextSemiBold('FAQ'),
          centerTitle: true,
          elevation: 0,
          bottom: TabBar(
            labelColor: Colors.white,
            labelStyle:const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 14,
                color:  Colors.white
            ),
            unselectedLabelColor: AppColors.primaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.primaryColor
            ),
            tabs: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 1,
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: TextBody(
                      ' General ',
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 1,
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: TextBody(
                      'Account',
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 1,
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: TextBody(
                      'Service',
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 1,
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: TextBody(
                      'Payment',
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],

          ),
        ),
        body: TabBarView(
          children: [
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
            ListView(
              children: [
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
                buildCard(
                  'What is Shipoka',
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam auctor, velit vitae dignissim varius, lorem purus scelerisque quam, ut pulvinar tellus velit laoreet velit. Maecenas in convallis dui. Morbi congue tortor justo, id aliquet mi scelerisque sed. Sed vestibulum turpis et erat volutpat, et scelerisque velit molestie. Donec sodales enim non sagittis lacinia. Fusce dictum elit et justo vehicula lacinia. Nunc ac viverra nulla. Aliquam sed semper nibh. Cras egestas auctor luctus.'
                ),
              ],
            ),
            Container(
              color: AppColors.buttonPink,
              child: const Center(
                child: Text(
                    'welcome'
                ),
              ),
            ),
            Container(
              color: AppColors.buttonPink,
              child: const Center(
                child: Text(
                    'welcome'
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

Widget buildCard(String s, String t) {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
    child: Card(
      child: ExpandablePanel(
        header: Text('What is Shipoka'),
        expanded: Container(),
        collapsed: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam auctor, velit vitae dignissim varius, lorem purus scelerisque quam, ut pulvinar tellus velit laoreet velit. Maecenas in convallis dui. Morbi congue tortor justo, id aliquet mi scelerisque sed. Sed vestibulum turpis et erat volutpat, et scelerisque velit molestie. Donec sodales enim non sagittis lacinia. Fusce dictum elit et justo vehicula lacinia. Nunc ac viverra nulla. Aliquam sed semper nibh. Cras egestas auctor luctus.'),
      )
    ),
  );
}
