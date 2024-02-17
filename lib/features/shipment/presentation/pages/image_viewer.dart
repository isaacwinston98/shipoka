import 'dart:io';

import 'package:flutter/material.dart';
class ImageViewer extends StatelessWidget {
  final String image;
  const ImageViewer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: const Color(0xff080B30).withOpacity(0.28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(height: MediaQuery.sizeOf(context).height * 0.2,),
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close,color: Colors.white,)),
                )),
            const SizedBox(height: 60,),
            Center(
              child: Hero(
                tag: image,
                child: Image.file(
                  File(image), // Convert the image path to File object
                  height: 256,
                  width: 368,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.2,),
          ],
        ),
      ),
    );
  }
}
