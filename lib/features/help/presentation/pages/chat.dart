import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/constant/app_asset.dart';

class ChatSupport extends StatefulWidget {
  const ChatSupport({super.key});

  @override
  State<ChatSupport> createState() => _ChatSupportState();
}

class _ChatSupportState extends State<ChatSupport> {
  final messageController = TextEditingController();
  List<Messages> messages = [
    Messages(
        isSentByMe: true,
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        text: 'Can i have my Money'),
    Messages(
        isSentByMe: false,
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        text: 'what will you do'),
    Messages(
        isSentByMe: false,
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        text: 'use the money and buy house'),
    Messages(
        isSentByMe: false,
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        text: 'i will use it and marry your sister')
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AppBackButton(),
                        Container(
                          alignment: Alignment.center,
                          child: TextSemiBold(
                            'Customer Support',
                            fontSize: 20,
                          ),
                        ),
                        Container(
                            decoration: const BoxDecoration(
                                color: AppColors.black,
                                shape: BoxShape.circle
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7),
                              child: SvgPicture.asset(AppAssets.call),
                            )),

                      ],
                    ),
                    const Gap(5),
                    const Divider(
                     thickness: 1,
                     color: AppColors.dividerGrey,
                    )
                  ],
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Divider(
                            thickness: 1,
                            color: AppColors.dividerGrey,
                          ),
                          const Gap(10),
                          InputField(
                              controller:messageController,
                            placeholder: 'Message',
                            suffix: SvgPicture.asset(AppAssets.image),
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: SvgPicture.asset(AppAssets.chat),
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

class Messages{
  final String text;
  final DateTime date;
  final bool isSentByMe;

  const Messages({
    required this.isSentByMe,
    required this.date,
    required this.text
});

}