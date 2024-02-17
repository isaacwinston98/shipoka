import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ImageBottomSheet extends StatelessWidget {
  final Function() onTap;

  const ImageBottomSheet({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Upload Image",
            style: TextStyle(fontSize: 16, color: Color(0xff101828)),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: (){
              onTap();
              Navigator.pop(context);

            },
            child: const SizedBox(
              child: Row(
                children: [
                  Icon(
                    Iconsax.camera,
                    color: Color(0xff344054),
                  ),
                  SizedBox(width: 10,),

                  Text(
                    "Take a picture",
                    style: TextStyle(fontSize: 16, color: Color(0xff344054)),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: (){
              onTap();
              Navigator.pop(context);

            },
            child: const SizedBox(
              child: Row(
                children: [
                  Icon(
                    Iconsax.gallery,
                    color: Color(0xff344054),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "Choose from gallery",
                    style: TextStyle(fontSize: 16, color: Color(0xff344054)),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
