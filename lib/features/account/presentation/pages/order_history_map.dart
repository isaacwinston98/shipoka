import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class OrderHistoryMap extends StatefulWidget {
  const OrderHistoryMap({super.key});

  @override
  State<OrderHistoryMap> createState() => _OrderHistoryMapState();
}

class _OrderHistoryMapState extends State<OrderHistoryMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Gap(10),
                    const AppBackButton(),
                    const Gap(20),
                    TextSemiBold(
                      'My Orders',
                      fontSize: 20,
                    ),
                  ],
                ),
                const Gap(10),
                TextBody(
                    'Order No: A1Y8728',
                  fontSize: 13,

                ),
                const Gap(5),
                TextBody(
                    'Playstation limited edition',
                  fontSize: 13,
                ),
                const Gap(5),
                TextBody(
                  'Thur, 19 Oct 2023 ',
                  fontSize: 13,
                ),
                const Gap(20),
                Container(
                  width:double.infinity,
                  decoration: const BoxDecoration(

                  ),
                  child: const Image(
                    image:AssetImage(
                      AppAssets.mapTrack,
                    ),
                  ),
                ),
                const Column(
                  children: [
                    Row(
                      children: [

                      ],
                    ),
                  ],
                )

              ],
            ),
          ),
      ),
    );
  }
}
