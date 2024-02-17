import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/features/shipment/data/package_category.dart';
import 'package:shipoka/features/shipment/presentation/changeNotifier/shipment_notifier.dart';
import 'package:shipoka/features/shipment/presentation/pages/image_viewer.dart';

class PackageDetailsEntry extends StatefulWidget {
  const PackageDetailsEntry({
    super.key,
  });

  @override
  State<PackageDetailsEntry> createState() => _PackageDetailsEntryState();
}

class _PackageDetailsEntryState extends State<PackageDetailsEntry> {
  File? image;
  Future pickImage(ImageSource source)async{
    try {
      final image =  await ImagePicker().pickImage(source: source);
      if(image == null)return;
      final temporaryImage = File(image.path);
      setState(() {
        this.image = temporaryImage;
      });
    } on PlatformException catch (e) {
      //
    }

  }

  List<String> category = [
    'Clothing',
    'Documents',
    'Electronics',
    'Perishable Goods'
  ];

  @override
  Widget build(BuildContext context) {
    final selectedCategoryProvider = Provider.of<ShipmentProvider>(context);
    final selectedCategory = selectedCategoryProvider.selectedCategory;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextBody(
            'Package 1',
          ),
          const Gap(15),
          const InputField(
            placeholder: 'Package Title',
            textInputType: TextInputType.text,
            controller: null,
          ),
          const Gap(10),
          GestureDetector(
            onTap: (){
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                      )
                  ),
                  context: context,
                  builder: (BuildContext context){
                    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent, // Change this to your preferred status bar color
                    ));
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.28,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 3.0,
                                  width: 50,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            const Gap(15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextSemiBold(
                                  'Package catergory',
                                  fontSize: 17,
                                ),
                              ],
                            ),
                            const Gap(20),
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount: category.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                                        child: ListTile(
                                          visualDensity:const VisualDensity(horizontal: 0, vertical: -4),
                                          title: TextBody(category[index]),
                                          onTap: () {
                                            // Update the selected category using provider
                                            selectedCategoryProvider.selectCategory(category[index].toString());
                                            Navigator.pop(context); // Close the bottom sheet
                                          },
                                        ),
                                      );
                                    },)
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.textFieldBackground
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextSmall(
                      selectedCategory ?? 'Package category',
                      color: selectedCategory != null ? AppColors.textColor:AppColors.personalProfileHint,
                      fontWeight: selectedCategory != null ? FontWeight.w500 : FontWeight.w300,
                      fontSize:  selectedCategory != null ? 14: 12,
                    ),
                    const Icon(
                        Icons.arrow_drop_down_outlined
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Gap(10),
          GestureDetector(
            onTap: (){
              showModalBottomSheet(
                showDragHandle: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                      )
                  ),
                  context: context,
                  builder: (BuildContext context){
                    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent, // Change this to your preferred status bar color
                    ));
                    return WeightBottomSheet(selectedCategoryProvider: selectedCategoryProvider);
                  }
              );
            },
            child : Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.textFieldBackground
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextSmall(
                      selectedCategoryProvider.selectedWeightIndex == -1
                          ? 'Package weight'
                          :   selectedCategoryProvider.selectedWeightIndex == 1
                          ?   'Below 5' : selectedCategoryProvider.selectedWeightIndex == 2
                          ?   '10kg' : '> 10kg',

                      color: selectedCategoryProvider.selectedWeightIndex == -1 ? AppColors.personalProfileHint : AppColors.textColor,
                      fontWeight: selectedCategoryProvider.selectedWeightIndex == -1 ? FontWeight.w300 : FontWeight.w500,
                      fontSize:  selectedCategoryProvider.selectedWeightIndex == -1 ? 12: 14,
                    ),
                    const Icon(
                        Icons.arrow_drop_down_outlined
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Gap(20),
          GestureDetector(
            onTap: (){
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                      )
                  ),
                  context: context,
                  builder: (BuildContext context){
                    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent, // Change this to your preferred status bar color
                    ));
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,),
                      child: Container(
                        color: AppColors.editPersonColor,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 3.0,
                                  width: 50,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            const Gap(15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextSemiBold(
                                  'Upload Image',
                                  fontSize: 17,
                                ),
                              ],
                            ),
                            const Gap(20),
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      pickImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppAssets.camera,
                                        ),
                                        const Gap(10),
                                        TextBody(
                                          'Take a picture',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        )
                                      ],
                                    ),
                                  ),
                                  const Gap(20),
                                  GestureDetector(
                                    onTap: (){
                                      pickImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppAssets.gallery,
                                        ),
                                        const Gap(10),
                                        TextBody(
                                          'Choose from gallery',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        )
                                      ],
                                    ),
                                  ),
                                  const Gap(10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              );
            },
            child: DottedBorder(
              color: AppColors.personalProfileHint,
              dashPattern: [5,2],
              radius: const Radius.circular(20),
              borderType: BorderType.RRect,
              strokeWidth: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        image != null
                        ? GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context)=> image != null
                                  ? ImageViewer(image: image!.path)
                                  : Container(),
                            ),);
                          },
                          child: Image.file(
                            image!,
                            width: 50.0,
                            height: 30.0,
                            fit: BoxFit.cover,
                          ),
                        )
                        :Container(),
                        const Gap(5)  ,
                        TextBody(
                          'Add Image',
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(AppAssets.add),
              const Gap(5),
              TextBody(
                'Add this Package',
                fontSize: 13,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w400,
              ),
              const Gap(5),
            ],
          ),
          const Gap(10),

        ]);
  }
}

class WeightBottomSheet extends StatelessWidget {
  const WeightBottomSheet({
    super.key,
    required this.selectedCategoryProvider,
  });

  final ShipmentProvider selectedCategoryProvider;

  @override
  Widget build(BuildContext context) {
    final wightProvider = Provider.of<ShipmentProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.28,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextSemiBold(
                  'Package weight',
                  fontSize: 17,
                ),
              ],
            ),
            const Gap(10),
            const Divider(
              height: 1,
              color: AppColors.dividerGrey,
            ),
            const Gap(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBody(
                  'Select Range',
                ),
                const Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        selectedCategoryProvider.updateSelectedWight(1);
                        },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.dividerGrey),
                          borderRadius: BorderRadius.circular(12),
                          color: wightProvider.selectedWeightIndex == 1 ? AppColors.primaryColor :null,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: Column(
                            children: [
                              TextSmall(
                                'Between'
                              ),
                              const Gap(5),
                              TextBody(
                                '1-5Kg',
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Gap(15),
                    GestureDetector(
                      onTap: (){
                        selectedCategoryProvider.updateSelectedWight(2);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.dividerGrey),
                          borderRadius: BorderRadius.circular(12),
                          color: wightProvider.selectedWeightIndex == 2 ? AppColors.primaryColor :null,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: Column(
                            children: [
                              TextSmall(
                                  'Weighs'
                              ),
                              const Gap(5),
                              TextBody(
                                '10Kg',
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Gap(15),
                    GestureDetector(
                      onTap: (){
                        selectedCategoryProvider.updateSelectedWight(3);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.dividerGrey),
                          borderRadius: BorderRadius.circular(12),
                          color: wightProvider.selectedWeightIndex == 3 ? AppColors.primaryColor :null,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: Column(
                            children: [
                              TextSmall(
                                  'Above'
                              ),
                              const Gap(5),
                              TextBody(
                                '10Kg',
                                color: AppColors.textColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
