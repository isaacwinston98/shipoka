import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shipoka/features/account/presentation/pages/add_new_card.dart';
import 'package:shipoka/features/shipment/data/package.dart';
import 'package:shipoka/features/shipment/presentation/changeNotifier/shipment_notifier.dart';
import 'package:shipoka/features/shipment/presentation/pages/image_viewer.dart';
import 'package:shipoka/features/shipment/presentation/widgets/category_bottom_sheet.dart';
import 'package:shipoka/features/shipment/presentation/widgets/image_bottom_sheet.dart';
import 'package:shipoka/features/shipment/presentation/widgets/weight_bottom_sheet.dart';

class PackageDetails extends StatelessWidget {
  final int index;
  final Package package;

  const PackageDetails({super.key, required this.index, required this.package});

  @override
  Widget build(BuildContext context) {
    final shipmentProvider = Provider.of<ShipmentProvider>(context);

    return Builder(builder: (conext){
      if(package.finalized){
        return Material(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Package ${index + 1}",
                      style: const TextStyle(fontSize: 16, color: Color(0xff101828)),
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: (){
                          shipmentProvider.editPackage(index);
                        },
                        child: const Icon(Iconsax.edit,size: 20,)),
                    const SizedBox(width: 15,),
                    GestureDetector(
                        onTap: (){
                          shipmentProvider.deletePackage(index);
                        },
                        child: const Icon(Iconsax.trash,color: Colors.red,size: 20,)),
                  ],
                ),
                const Divider(),
                const SizedBox(height: 10,),
                Text(
                  package.title,
                  style: const TextStyle(fontSize: 14, color: Color(0xff344054)),
                ),
                const SizedBox(height: 15,),
                Text(
                  package.category,
                  style: const TextStyle(fontSize: 13, color: Color(0xff344054)),
                ),Text(
                  package.weight.toText(),
                  style: const TextStyle(fontSize: 13, color: Color(0xff344054)),
                ),

              ],
            ),
          ),
        );
      }else{
        return Material(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Package ${index + 1}",
                  style: const TextStyle(fontSize: 16, color: Color(0xff101828)),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppTextField(
                  hint: 'Package Title',
                  initialValue: package.title,
                  onChanged: (value){
                    shipmentProvider.updatePackageTitle(index: index, title: value!);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () async {
                    await showModalBottomSheet(
                        context: context,
                        builder: (context) => CategoryBottomSheet(
                          onTap: (category) {
                            shipmentProvider.updatePackageCategory(
                                index: index, category: category);
                          },
                        ),
                        backgroundColor: Colors.transparent);
                  },
                  child: AppTextField(
                    hint: 'Package Category',
                    controller: TextEditingController(text: package.category),
                    enabled: false,
                    suffixIcon:
                    const Icon(Icons.arrow_drop_down, color: Color(0xff101828)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () async {
                    await showModalBottomSheet(
                        context: context,
                        builder: (context) => WeightBottomSheet(
                          selectedWeight: package.weight,
                          onTap: (weight) {
                            shipmentProvider.updatePackageWeight(
                                index: index, weight: weight);
                          },
                        ),
                        backgroundColor: Colors.transparent);
                  },
                  child: AppTextField(
                    hint: 'Package Weight',
                    enabled: false,
                    controller: TextEditingController(text: package.weight.toText()),
                    suffixIcon:
                    const Icon(Icons.arrow_drop_down, color: Color(0xff101828)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () async {
                    await showModalBottomSheet(
                        context: context,
                        builder: (context) => ImageBottomSheet(onTap: () {
                          shipmentProvider.updatePackageImage(index: index);
                        }),
                        backgroundColor: Colors.transparent);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                            color: const Color(0xff080B30).withOpacity(0.5))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        package.image.isEmpty?const SizedBox():
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ImageViewer(image: package.image),),);
                            },
                            child: Hero(
                                tag: package.image,
                                child: Image.asset(package.image,width: 57,height: 30,))),
                        const SizedBox(width: 10,),
                        const Text(
                          "Add Image",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xffFC7233),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Align(alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.add_circle,color: Color(0xff344054),size: 18,),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          shipmentProvider.addThisPackage(index);
                        },
                        child: const Text("Add this package",style: TextStyle(
                            fontSize: 14,color: Color(0xffF26520)
                        ),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
    });
  }
}
